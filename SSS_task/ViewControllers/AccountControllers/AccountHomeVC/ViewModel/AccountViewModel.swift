//
//  AccountViewModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 30/10/23.
//

import Foundation

class AccountViewModel{
    
    //MARK: Variables
    var loggedinDataArr  = [ AccountOptionsModel(isCollection: true, isBannerView: false, isTitle: false,identifier: .orderOptions),
                             AccountOptionsModel(isCollection: false, isBannerView: true, isTitle: false, identifier: .gamePointsBanner),
                             AccountOptionsModel(isCollection: false, isBannerView: true, isTitle: false, identifier: .funzone),
                             AccountOptionsModel(isCollection: false, isBannerView: false, isTitle: true, identifier: .accountHeader),
                             AccountOptionsModel(isCollection: true, isBannerView: false, isTitle: false, identifier: .accountOptions),
                             AccountOptionsModel(isCollection: false, isBannerView: false, isTitle: true, identifier: .helpHeader),
                             AccountOptionsModel(isCollection: true, isBannerView: false, isTitle: false, identifier: .helpOptions)
    ]
    
    var dataArr = [
        AccountOptionsModel(isCollection: true, isBannerView: false, isTitle: false,identifier: .orderOptions),
        AccountOptionsModel(isCollection: false, isBannerView: true, isTitle: false, identifier: .funzone),
        AccountOptionsModel(isCollection: false, isBannerView: false, isTitle: true, identifier: .helpHeader),
        AccountOptionsModel(isCollection: true, isBannerView: false, isTitle: false, identifier: .helpOptions)
    ]
    
    //isUserLoggedInDefault
    var userDefault: Bool {
        UserDefaults.standard.bool(forKey: "isUserLoggedInUserDefault")
    }
    public var isUserLoggedin = false
    var userName = ""
    
    
}
