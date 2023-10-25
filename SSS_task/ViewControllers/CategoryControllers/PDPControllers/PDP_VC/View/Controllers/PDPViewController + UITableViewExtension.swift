//
//  v.swift
//  SSS_task
//
//  Created by Sunny Patel on 25/10/23.
//

import UIKit

//MARK: TableView Delegates and DataSource
extension PDPViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pdpViewModel.descriptionArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = pdpViewModel.descriptionArr[indexPath.row]
        
        switch model.identifier {
        case .previewImage:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductPreviewTableCell", for: indexPath) as? ProductPreviewTableCell else {return UITableViewCell()}
            if let imageData = pdpViewModel.productArr?.imageGroups?[pdpViewModel.currentProduct].images{
                cell.currentProduct = pdpViewModel.currentProduct
                cell.showCell(data: pdpViewModel.productArr!)
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
            cell.colourCount = pdpViewModel.productArr?.imageGroups?.count ?? 0
            if let colourData = pdpViewModel.productArr?.imageGroups{
                cell.colourDataArr = colourData
                cell.closure = { [weak self] value in
                    self?.pdpViewModel.currentProduct = value
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
            if let model = pdpViewModel.productArr {
                cell.showData(model: model)
            }
            
            return cell
        case .sizeOption:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SizeOptionCell", for: indexPath) as? SizeOptionCell else {return UITableViewCell()}
            return cell
        case .productDetails:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath) as? ExpandableCell else {return UITableViewCell()}
            cell.setData(model: pdpViewModel.dataSource[indexPath.row])
            if let desc = pdpViewModel.productArr?.shortDescription {
                cell.descLabel.text = desc.html2String
            }
            return cell
        case .deliveryOptions:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath) as? ExpandableCell else {return UITableViewCell()}
            cell.setData(model: pdpViewModel.dataSource[indexPath.row])
            return cell
        case .returnsAndExchange:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath) as? ExpandableCell else {return UITableViewCell()}
            cell.setData(model: pdpViewModel.dataSource[indexPath.row])
            cell.descLabel.text = " asbfdhijbswhiefgaiughfiugbiasdhgifjhrsughijpadfiufgjvjkcdnjklvxmnjkxncogjs[ajugur0hgifhiuhhjoihjjiji[hiohiou"
            return cell
        case .termsAndConditions:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath) as? ExpandableCell else {return UITableViewCell()}
            cell.setData(model: pdpViewModel.dataSource[indexPath.row])
            if let desc = pdpViewModel.productArr?.cTermsAndConditionsText {
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
        let model = pdpViewModel.descriptionArr[indexPath.row]
        
        switch model.identifier{
        case .productDetails, .deliveryOptions, .returnsAndExchange, .termsAndConditions:
            pdpViewModel.dataSource[indexPath.row].isExpanded.toggle()
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
