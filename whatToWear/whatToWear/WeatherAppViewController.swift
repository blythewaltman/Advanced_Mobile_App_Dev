//
//  WeatherAppViewController.swift
//  whatToWear
//
//  Created by Blythe Waltman on 2/3/21.
//

import UIKit

class WeatherAppViewController: UIViewController {

    @IBAction func goToWeather(_ sender: Any) {
        //check to see if there is an app installed to handle this URl scheme
        if(UIApplication.shared.canOpenURL(URL(string:"darksky://")!)){
            UIApplication.shared.open(URL(string: "darksky://")!, options: [:], completionHandler: nil)
        }
        else{
            if(UIApplication.shared.canOpenURL(URL(string:"weather://")!)){
                UIApplication.shared.open(URL(string: "weather://")!, options: [:], completionHandler: nil)
            }
            else{
                UIApplication.shared.open(URL(string: "http://www.weather.com/")!, options: [:], completionHandler: nil)
                
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
