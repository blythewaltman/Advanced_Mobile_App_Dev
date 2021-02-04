//
//  ViewController.swift
//  whatToWear
//
//  Created by Blythe Waltman on 2/2/21.
//

import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    private var selectedColor = UIColor.systemGray
    /* boolean variables to indicate which buttons should change from the color picker*/
    private var changeFirstButton = false
    private var changeSecondButton = false
    private var changeThirdButton = false
    private var changeFourthButton = false
    private var colorPicker = UIColorPickerViewController()

    @IBOutlet weak var ColorButton: UIButton!
    @IBOutlet weak var secondColorButton: UIButton!
    @IBOutlet weak var thirdColorButton: UIButton!
    @IBOutlet weak var fourthColorButton: UIButton!
    
    /* information on how to display the color picker was found in the tutorial https://www.youtube.com/watch?v=67XqAZVeJl0 */
    func displayColorPicker(){
        colorPicker.supportsAlpha = true
        colorPicker.selectedColor = selectedColor
        present(colorPicker, animated: true)
    }
    
    
    @IBAction func changeButtonColor(_ sender: Any) {
        //make sure that the right button's color is changing
        changeFirstButton = true
        changeSecondButton = false
        changeThirdButton = false
        changeFourthButton = false
        
        // Animate the color picker for the button
        displayColorPicker()
    }
    @IBAction func changeSecondButtonColor(_ sender: Any) {
        changeFirstButton = false
        changeSecondButton = true
        changeThirdButton = false
        changeFourthButton = false
        
        // Animate the color picker for the button
        displayColorPicker()
    }
    
    @IBAction func changeThirdColorButton(_ sender: Any) {
        changeFirstButton = false
        changeSecondButton = false
        changeThirdButton = true
        changeFourthButton = false
        
        // Animate the color picker for the button
        displayColorPicker()
    }
    @IBAction func changeFourthColorButton(_ sender: Any) {
        changeFirstButton = false
        changeSecondButton = false
        changeThirdButton = false
        changeFourthButton = true
        
        // Animate the color picker for the button
        displayColorPicker()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* set the delegate for the colorpicker */
        colorPicker.delegate = self
        
        /* starter values for first button */
        ColorButton.backgroundColor = UIColor.systemGray2
        ColorButton.layer.cornerRadius = 5
        
        /* starter values for second button */
        secondColorButton.backgroundColor = UIColor.systemGray3
        secondColorButton.layer.cornerRadius = 5
        
        /* starter values for third button */
        thirdColorButton.backgroundColor = UIColor.systemGray3
        thirdColorButton.layer.cornerRadius = 5
        
        /* starter values for fourth button */
        fourthColorButton.backgroundColor = UIColor.systemGray2
        fourthColorButton.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
    }

    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        selectedColor = viewController.selectedColor
        if changeFirstButton == true{
            ColorButton.backgroundColor = selectedColor
        }
        else if changeSecondButton == true{
            secondColorButton.backgroundColor = selectedColor
        }
        else if changeThirdButton == true{
            thirdColorButton.backgroundColor = selectedColor
        }
        else if changeFourthButton == true{
            fourthColorButton.backgroundColor = selectedColor
        }
        else{
            print("Error changing any of the buttons colors")
        }
    }
    
}



