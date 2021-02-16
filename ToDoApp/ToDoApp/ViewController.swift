//
//  ViewController.swift
//  ToDoApp
//
//  Created by Blythe Waltman on 2/15/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var daysList = [String]()
    var daysData = WeekDataLoader()
    let dataFile = "week"

    override func viewDidLoad() {
        super.viewDidLoad()
        daysData.loadData(filename: dataFile)
        daysList = daysData.getDays()
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tasksegue"{
            if let taskVC = segue.destination as? TaskViewController{
                if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!){
                    taskVC.title = daysList[indexPath.row]
                    taskVC.daysData = daysData
                    taskVC.selectedDay = indexPath.row
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weekIdentifier", for: indexPath)
        cell.textLabel?.text = daysList[indexPath.row]
        return cell
    }

}

