//
//  ViewController.swift
//  SoCal Sales Tax Calculator
//
//  Created by Justin Kim on 7/26/17.
//  Copyright © 2017 Justin Kim. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var tax: Double = 0.095
    var pickViewChoice: String!
    var selectedRow = 0
    
    enum taxType: String {
        case Avalon = "Avalon"
        case Commerce = "Commerce"
        case Compton = "Compton"
        case CulverCity = "Culver City"
        case ElMonte = "El Monte"
        case Inglewood = "Inglewood"
        case LaMirada = "La Mirada"
        case LongBeach = "Long Beach"
        case LosAngeles = "Los Angeles"
        case OrangeCounty = "Orange County"
        case PicoRivera = "Pico Rivera"
        case SanFernando = "San Fernando"
        case SantaMonica = "Santa Monica"
        case SouthElMonte = "South El Monte"
        case SouthGate = "South Gate"
        case EverywhereElse = "Everywhere Else in LA"
    }
    
    let colors = ["\(taxType.Avalon.rawValue)","\(taxType.Commerce.rawValue)","\(taxType.Compton.rawValue)","\(taxType.CulverCity.rawValue)","\(taxType.ElMonte.rawValue)","\(taxType.Inglewood.rawValue)","\(taxType.LaMirada.rawValue)","\(taxType.LongBeach.rawValue)","\(taxType.LosAngeles.rawValue)","\(taxType.OrangeCounty.rawValue)","\(taxType.PicoRivera.rawValue)","\(taxType.SanFernando.rawValue)","\(taxType.SantaMonica.rawValue)","\(taxType.SouthElMonte.rawValue)","\(taxType.SouthGate.rawValue)","\(taxType.EverywhereElse.rawValue)"]
    
    @IBOutlet weak var listedPriceView: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var actualPriceView: UITextField!
    @IBAction func calculateTax(_ sender: Any) {
        guard let text = listedPriceView.text,
            let listedPrice = Double(text)
            else{
                print("ERROR AHH")
                return
        }
        switch self.selectedRow {
        case 0 : //Avalon
            tax = 0.1
        case 1 : //Commerce
            tax = 0.1
        case 2 : //Compton
            tax = 0.105
        case 3 : //Culver City
            tax = 0.1
        case 4 : //El Monte
            tax = 0.1
        case 5 : //Inglewood
            tax = 0.1
        case 6 : //La Mirada
            tax = 0.105
        case 7 : //Long Beach
            tax = 0.105
        case 8 : //Los Angeles
            tax = 0.095
        case 9 : //Orange County
            tax = 0.08125
        case 10 : //Pico Rivera
            tax = 0.105
        case 11 : //San Fernando
            tax = 0.1
        case 12 : //Santa Monica
            tax = 0.1
        case 13 : //South El Monte
            tax = 0.1
        case 14 : //South Gate
            tax = 0.105
        case 15 : //Everywhere Else
            tax = 0.095
        default:
            return
        }
        
        let roundedPriceAmount = round(100 * listedPrice) / 100
        let salesTaxAmount = roundedPriceAmount * tax
        let actualPrice = roundedPriceAmount + salesTaxAmount
        
        if (!listedPriceView.isEditing){
            listedPriceView.text = String(format: "%.2f", actualPrice)
        } else{
            listedPriceView.text = ""
            actualPriceView.text = ""
        }
        actualPriceView.text = String(format: "%.2f", actualPrice)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



