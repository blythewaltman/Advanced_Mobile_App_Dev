//
//  AddTaskViewController.swift
//  ToDoApp
//
//  Created by Blythe Waltman on 2/15/21.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    
    var addedTask = String()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveSegue"{
            if taskTextField.text?.isEmpty == false{
                addedTask = taskTextField.text!
            }
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

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
