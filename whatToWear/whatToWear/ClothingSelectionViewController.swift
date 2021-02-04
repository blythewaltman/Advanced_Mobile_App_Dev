//
//  ClothingSelectionViewController.swift
//  whatToWear
//
//  Created by Blythe Waltman on 2/3/21.
//

import UIKit

class ClothingSelectionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var clothingPicker: UIPickerView!
    @IBOutlet weak var choiceLabel: UILabel!
    
    var itemData = DataLoader()
    var items = [String]()
    var options = [String]()
    let itemComponent = 0
    let optionComponent = 1
    let filename = "clothing"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == itemComponent{
            return items.count
        }
        else{
            return options.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == itemComponent{
            return items[row]
        }
        else{
            return options[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == itemComponent{
            options = itemData.getOptions(index: row)
            clothingPicker.reloadComponent(optionComponent)
            clothingPicker.selectRow(0, inComponent: optionComponent, animated: true)
        }
        let itemrow = pickerView.selectedRow(inComponent: itemComponent)
        let optionrow = pickerView.selectedRow(inComponent: optionComponent)
        choiceLabel.text = "Thinking about wearing the \(items[itemrow]): \(options[optionrow])."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemData.loadData(filename: filename)
        items = itemData.getItems()
        options = itemData.getOptions(index: 0)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
