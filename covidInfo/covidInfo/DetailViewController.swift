//
//  DetailViewController.swift
//  covidInfo
//
//  Created by Blythe Waltman on 3/6/21.
//

import UIKit

class DetailViewController: UIViewController {

    var country : String = ""
    var nameDataHandler = CovidDataHandler()
    var data = [String]()
    
    @IBOutlet weak var numConfirmed: UILabel!
    @IBOutlet weak var numRecovered: UILabel!
    @IBOutlet weak var numCritical: UILabel!
    @IBOutlet weak var numDeaths: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        nameDataHandler.onDataUpdate = {[weak self] (data:[String]) in self?.render()}
        nameDataHandler.loadjson(country)
    }
    
    func render() {
        data = nameDataHandler.getNames()
        self.numConfirmed.text = data[1]
        self.numRecovered.text = data[2]
        self.numCritical.text = data[3]
        self.numDeaths.text = data[4]
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
