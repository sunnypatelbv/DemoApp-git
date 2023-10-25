//
//  ProductDetailCollectionCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 28/09/23.
//

import UIKit

class ProductDetailCollectionCell: UICollectionViewCell {
    
    //MARK:IBOutlet
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var produtBrandLabel: UILabel!
    @IBOutlet weak var productDescLabel: UILabel! 
    @IBOutlet weak var numberOfColorsLabel: UILabel!

    @IBOutlet weak var discountLabel: UILabel! //c_percentage
    @IBOutlet weak var addToWishlistBtn: UIButton!
    @IBOutlet weak var saleLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var originalPriceLabel: UILabel! //c_listPrice
    @IBOutlet weak var discountPriceLabel: UILabel!  //c_salePrice
    
    //MARK: Variables
    var isWishlistTapped = false
    var prouctId = ""
    var closure : ((Bool) -> ())?
    
    //MARK: IBActions
    @IBAction func addToWishlistTapped(){
        
        if isWishlistTapped {
            print("Removing from wishlist")
            addToWishlistBtn.setImage(UIImage(systemName: "heart"), for: .normal)
            isWishlistTapped = false
            
            
        }
        else {
            print("Adding in wishlist")
            addToWishlistBtn.setImage(UIImage(systemName:"heart.fill"), for: .normal)
            closure?(true)
            isWishlistTapped = true
            fetchData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        discountLabel.isHidden = true
        saleLabel.isHidden = true
        productImg.image = nil
        productImg.layer.cornerRadius = 12
        discountLabel.layer.masksToBounds = true
        discountLabel.layer.cornerRadius = 12
        discountPriceLabel.isHidden = false
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "AED 620.00")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: attributeString.length))
        originalPriceLabel.attributedText = attributeString
        // Initialization code
    }
    
    
    //MARK: Functions
    
    func fetchData(){
        let urlComponents = URLComponents(string: "https://ov-dev.sssports.com/s/UAE/dw/shop/v20_10/customers/bcbpcY1HgG9oyITnupOjaFha8w/product_lists/3fddb66d6267c881a67e3cb8cd/items")
        var request = URLRequest(url: (urlComponents?.url)!)
        guard let token = UserDefaults.standard.object(forKey: "authToken") else {return}
        request.httpMethod = "POST"
        request.setValue("\(token)", forHTTPHeaderField: "Authorization")
        let params = [
            "product_id": "\(prouctId)",
            "type": "product",
            "quantity": 1,
            "public": true,
            "priority": 0
        ] as [String : Any]
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//                print(json)
                let wishlistData = try? JSONDecoder().decode(AddWishlistModel.self, from: data)
                
            }
            catch {
                print(error.localizedDescription)
            }
            
            
        }
        task.resume()
        
        
    }
    
    
    
    
    
    func showData(hit: Hit, onIndexPath: Int){
        if let brandName = hit.cBrand{
            produtBrandLabel.text = brandName.rawValue
        }
        
        if let productName = hit.productName {
            productDescLabel.text = productName
        }
        
        if let colorsCount = hit.cColorsCount{
            numberOfColorsLabel.text = "\(colorsCount) colour"
        }
        
        if let listPrice = hit.cListPrice{
            originalPriceLabel.text = "AED. \(listPrice).00"
        }
        
        if let salePrice = hit.cSalePrice{
            discountPriceLabel.text = "AED. \(salePrice).00"
        }
        
        if let sale = hit.cBadges?.automated?.first{
            saleLabel.isHidden = false
            saleLabel.text = "\(sale)".capitalized
        }
        
        if let discountValue = hit.cPercentage{
            discountLabel.isHidden = false
            discountLabel.text = "\(discountValue) %"
        }
        
        if let productImage = hit.cProductImages?.medium![onIndexPath].url{
            
            guard let url = URL(string: productImage) else {return}
            DispatchQueue.global().async {
                [weak self] in
                if let data = try? Data(contentsOf: url){
                    if let image = UIImage(data: data){
                        DispatchQueue.main.async {
                            self!.productImg.image = image
                        }
                    }
                }
            }
        }
        
    }
    
}
