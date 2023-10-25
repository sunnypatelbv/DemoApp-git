//
//  PDPViewController.swift
//  SSS_task
//
//  Created by Sunny Patel on 03/10/23.
//

import UIKit

class PDPViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    var descriptionArr = [
        ProductDescriptionDesignModel(isPreviewProductImage: true, isColourOption: false, isProductDetail: false, isOffer: false, isSize: false, identifier: .previewImage),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: true, isProductDetail: false, isOffer: false, isSize: false, identifier: .colourOption),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: true, isOffer: false, isSize: false, identifier: .productDetail),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: true, isOffer: false, isSize: true, identifier: .sizeOption),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: true, isOffer: false, isSize: false, identifier: .productDetails),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: true, isOffer: false, isSize: false, identifier: .deliveryOptions),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: true, isOffer: false, isSize: false, identifier: .termsAndConditions),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: true, isOffer: false, isSize: false, identifier: .returnsAndExchange),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: false, isOffer: false, isSize: false, identifier: .header),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: false, isOffer: false, isSize: false, identifier: .product),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: false, isOffer: false, isSize: false, identifier: .product),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: false, isOffer: false, isSize: false, identifier: .product)
    ]
    
    var productArr : PDPModel?
    var dataSource = ExpandableCellDataModel.mockedData
    var currentProduct = 0
    let url = "https://ov-dev.sssports.com/s/UAE/dw/shop/v20_10/products/UA1345776-112?select=(*,%20image_groups.(**),%20variation_attributes.(**),%20variation_groups.(**),%20inventory.(**),%20variants.(orderable,%20product_id),%20type.(**),%20variation_values.(**),%20master.(master_id))&client_id=ce6abb4e-faf1-41af-94e7-feb1e2dd4a77&expand=availability,%20variations,%20images,%20prices,%20promotions&locale=en-AE&all_images=true&action=bestprice"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ProductPreviewTableCell", bundle: nil), forCellReuseIdentifier: "ProductPreviewTableCell")
        tableView.register(UINib(nibName: "ProductColourCell", bundle: nil), forCellReuseIdentifier: "ProductColourCell")
        tableView.register(UINib(nibName: "ProductDescriptionCell", bundle: nil), forCellReuseIdentifier: "ProductDescriptionCell")
        tableView.register(UINib(nibName: "ExpandableCell", bundle: nil), forCellReuseIdentifier: "ExpandableCell")
        tableView.register(UINib(nibName: "SizeOptionCell", bundle: nil), forCellReuseIdentifier: "SizeOptionCell")
        tableView.register(UINib(nibName: "SectionHeaderCell", bundle: nil), forCellReuseIdentifier: "SectionHeaderCell")
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        tableView.delegate = self
        tableView.dataSource = self
        APIManager.shared.fetchData(pageUrl: url, dataModel: PDPModel.self, completionHandler: {[weak self] (data) in
            self?.productArr = data
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
        
        // Do any additional setup after loading the view.
    }
}


//MARK: TableView Delegates and DataSource
extension PDPViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        descriptionArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = descriptionArr[indexPath.row]
        
        switch model.identifier {
        case .previewImage:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductPreviewTableCell", for: indexPath) as? ProductPreviewTableCell else {return UITableViewCell()}
            if let imageData = productArr?.imageGroups?[currentProduct].images{
                cell.currentProduct = currentProduct
                cell.showCell(data: productArr!)
                cell.closure = { [weak self] (value, url) in
                    guard let vc = self?.storyboard?.instantiateViewController(identifier: "ProductImageController") as? ProductImageController else {return}
                    vc.imageURL = url
                    vc.imageDataArr = imageData
                    self?.present(vc, animated: true, completion: nil)
                }
            }
            DispatchQueue.main.async {
                cell.collectionView.reloadData()
            }

            return cell
        case .colourOption:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductColourCell", for: indexPath) as? ProductColourCell else {return UITableViewCell()}
            cell.colourCount = productArr?.imageGroups?.count ?? 0
            if let colourData = productArr?.imageGroups{
                cell.colourDataArr = colourData
                cell.closure = { [weak self] value in
                    self?.currentProduct = value
                    tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                }
            }
            DispatchQueue.main.async {
                cell.collectionView.reloadData()
            }
//            cell.collectionView.reloadData()
            return cell
        case .productDetail:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDescriptionCell", for: indexPath) as? ProductDescriptionCell else {return UITableViewCell()}
            if let model = productArr {
                cell.showData(model: model)
            }
            
            return cell
        case .sizeOption:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SizeOptionCell", for: indexPath) as? SizeOptionCell else {return UITableViewCell()}
            return cell
        case .productDetails:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath) as? ExpandableCell else {return UITableViewCell()}
            cell.setData(model: dataSource[indexPath.row])
            if let desc = productArr?.shortDescription {
                cell.descLabel.text = desc.html2String
            }
            return cell
        case .deliveryOptions:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath) as? ExpandableCell else {return UITableViewCell()}
            cell.setData(model: dataSource[indexPath.row])
            return cell
        case .returnsAndExchange:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath) as? ExpandableCell else {return UITableViewCell()}
            cell.setData(model: dataSource[indexPath.row])
            cell.descLabel.text = " asbfdhijbswhiefgaiughfiugbiasdhgifjhrsughijpadfiufgjvjkcdnjklvxmnjkxncogjs[ajugur0hgifhiuhhjoihjjiji[hiohiou"
            return cell
        case .termsAndConditions:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath) as? ExpandableCell else {return UITableViewCell()}
            cell.setData(model: dataSource[indexPath.row])
            if let desc = productArr?.cTermsAndConditionsText {
                cell.descLabel.text = desc.html2String
            }
            return cell
        case .header:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SectionHeaderCell", for: indexPath) as? SectionHeaderCell else {return UITableViewCell()}
            cell.label.text = "Recently viewed"
            return cell
        case .product:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell else {return UITableViewCell()}
            return cell
        default:
            break
        }
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = descriptionArr[indexPath.row]
        
        switch model.identifier{
        case .productDetails, .deliveryOptions, .returnsAndExchange, .termsAndConditions:
            dataSource[indexPath.row].isExpanded.toggle()
            tableView.reloadRows(at: [indexPath], with: .automatic)
        case .sizeOption:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SizeOptionCell", for: indexPath) as? SizeOptionCell else {return}
            tableView.reloadRows(at: [indexPath], with: .automatic)
            let height = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
            cell.heightConstraint.constant = height
            self.view.setNeedsLayout()
        default:
            break
            
        }
    }
    
}





