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
    let tempToken = "eyJfdiI6IjEiLCJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdiI6IjEiLCJleHAiOjE3MDEwODU2OTcsImlhdCI6MTcwMTA4Mzg5NywiaXNzIjoiY2U2YWJiNGUtZmFmMS00MWFmLTk0ZTctZmViMWUyZGQ0YTc3Iiwic3ViIjoie1wiX3ZcIjpcIjFcIixcImN1c3RvbWVyX2luZm9cIjp7XCJjdXN0b21lcl9pZFwiOlwiYmNicGNZMUhnRzlveUlUbnVwT2phRmhhOHdcIixcImd1ZXN0XCI6ZmFsc2UsXCJ2aXNpdF9pZFwiOlwiY2QzZjY0NGU3NWQxNTdlOGMyYjAwMjM5ZjZcIn19In0.dl8XgldAVo8SGRDrrSAdnbD_tnRnfYwIrohjhsPW78JgTif2kukQqnB74RgKHRx6U5CTBee8ktTVwqnmtguRT3VoIxsrNgGYgTMYaXJ6ERme4As34xBkJHDzg-RFOC64t3N_gHPoytMf5b6CK6eCb1RbxROhB6yTIZ22eBUoXGpz5b-AJUuc5fbqgEHc_K4_FpnzIMkQoCpbf5Ilgq_88bUatUbMXmwckmazQD3iDK96Y2NpG_mOX_gOmYm_m7hJzKuY4zU90SGc-GYkbBKfRPK3GthTr0LNXVsknydirpsZDI1hlBjrCxNz689-ogulGmOL-nbuRes2DI281xNeQ6AfTFv1QZ0Ht928yXXGJohgZ6EUm-53XfvdGs-mvg093AKxCA1ThkkSq_6OsXroLf7dIstCSj8bbe-POGM6bXMqimc2ZSPOBiCNTgRY3tsdId1gHApd9GsoPTqiZhXnZzcSzIzFFknCW23BWEBhiQKcqBzlUO4jqvL_073fqjltyTrQctxNPDhkIfZVgEoULcap1ljcM0GhtgU9TKSY-4SAJDDSq3NF_VeI3Jv4pCla"

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
        //
        //        let urlComponents = URLComponents(string: "https://ov-dev.sssports.com/s/UAE/dw/shop/v20_10/customers/bcbpcY1HgG9oyITnupOjaFha8w/product_lists/3fddb66d6267c881a67e3cb8cd/items")
        let url = "https://ov-dev.sssports.com/s/UAE/dw/shop/v20_10/customers/bcbpcY1HgG9oyITnupOjaFha8w/product_lists/3fddb66d6267c881a67e3cb8cd/items"
        //        let urlStr = "\(urlComponents?.url)"
        let params = [
            "product_id": "\(prouctId)",
            "type": "product",
            "quantity": 1,
            "public": true,
            "priority": 0
        ] as [String : Any]
        print(params)
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {return}
        guard let basic = UserDefaults.standard.string(forKey: "basicKey") else {return}
        print(token)
        let header = [
            "Authorization": token
        ]
        
        APIManager.shared.postRequest(url: url, body: params, httpHeaders: header, type: AddWishlistModel.self) { (data, response, error) in
            if let data = data, error == nil {

                if let response = response as? HTTPURLResponse{
                    if response.statusCode == 200 {
                        print("Success")
                    }
                    else if response.statusCode == 401{
                        if data.fault?.type == "InvalidAuthorizationHeaderException" || data.fault?.type == "ExpiredTokenException"{
                            print("token expried")
                            self.refreshTokenCalled()
                            print(UserDefaults.standard.string(forKey: "authToken"))
                            return
                        }
                    }
                }
            }
        }
        
        
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
    
    func refreshTokenCalled(){
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ov-dev.sssports.com"
        components.path = "/s/UAE/dw/shop/v20_10/customers/auth"
        components.queryItems = [
            URLQueryItem(name: "locale", value: "en-AE"),
            URLQueryItem(name: "client_id", value: "ce6abb4e-faf1-41af-94e7-feb1e2dd4a77")
        ]
        guard let url = components.url else {return}
        let parameters = [
            "type": "credentials"
        ] as? [String : Any]
        guard let basic = UserDefaults.standard.string(forKey: "basicKey") else {return}
        let header = [
            "Authorization" : "Basic \(basic)"
        ]
        
        APIManager.shared.postRequest(url: url.absoluteString, body: parameters, httpHeaders: header, type: LoginResponseData.self) { (data, response, error) in
            print(url)
            let response = (response as! HTTPURLResponse)
            if response.statusCode == 200{
                DispatchQueue.main.async {
                    guard let tokenStr = response.allHeaderFields["Authorization"] else {return}
//                    UserDefaults.standard.set(response.allHeaderFields["Authorization"], forKey: "authToken")
//                    UserDefaults.standard.data(forKey: "authToken")
                    UserDefaults.standard.set(tokenStr, forKey: "authToken")
                }
            }
        }
        
    }
    
}

//extension ProductDetailCollectionCell{
//    func decode(jwtToken jwt: String) throws -> [String: Any] {
//
//        enum DecodeErrors: Error {
//            case badToken
//            case other
//        }
//
//        func base64Decode(_ base64: String) throws -> Data {
//            let base64 = base64
//                .replacingOccurrences(of: "-", with: "+")
//                .replacingOccurrences(of: "_", with: "/")
//            let padded = base64.padding(toLength: ((base64.count + 3) / 4) * 4, withPad: "=", startingAt: 0)
//            guard let decoded = Data(base64Encoded: padded) else {
//                throw DecodeErrors.badToken
//            }
//            return decoded
//        }
//
//        func decodeJWTPart(_ value: String) throws -> [String: Any] {
//            let bodyData = try base64Decode(value)
//            let json = try JSONSerialization.jsonObject(with: bodyData, options: [])
//            guard let payload = json as? [String: Any] else {
//                throw DecodeErrors.other
//            }
//            return payload
//        }
//
//        let segments = jwt.components(separatedBy: ".")
//        return try decodeJWTPart(segments[1])
//    }
//}
