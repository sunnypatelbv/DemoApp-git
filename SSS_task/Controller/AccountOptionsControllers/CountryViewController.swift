//
//  CountryViewController.swift
//  SSS_task
//
//  Created by Sunny Patel on 26/09/23.
//

import UIKit
import CountryPickerView


class CountryViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var countryPickerView: CountryPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0)
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension CountryViewController: CountryPickerViewDelegate, CountryPickerViewDataSource {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        print("p")
    }
    

}
