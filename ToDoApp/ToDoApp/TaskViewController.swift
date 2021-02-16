//
//  TaskViewController.swift
//  ToDoApp
//
//  Created by Blythe Waltman on 2/15/21.
//

import UIKit

class TaskViewController: UITableViewController {
    
    var daysData = WeekDataLoader()
    var selectedDay = 0
    var taskList = [String]()
    var searchController = UISearchController()
    var resultsController = SearchResultsController()
    
    override func viewWillAppear(_ animated: Bool) {
        taskList = daysData.getTasks(index: selectedDay)
        resultsController.allTasks = taskList
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        resultsController.allTasks = taskList
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.searchBar.placeholder = "Enter a search term" //place holder text
        searchController.searchBar.sizeToFit() //sets appropriate size for the search bar
        tableView.tableHeaderView=searchController.searchBar //install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results
    }
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        if segue.identifier == "saveSegue"{
            if let source = segue.source as? AddTaskViewController{
                if source.addedTask.isEmpty == false{
                    daysData.addTask(index: selectedDay, newTask: source.addedTask, newIndex: taskList.count)
                    taskList.append(source.addedTask)
                    tableView.reloadData()
                    resultsController.allTasks = taskList
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskIdentifier", for: indexPath)

        cell.textLabel?.text = taskList[indexPath.row]

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taskList.remove(at: indexPath.row)
          //  daysData.deleteTask
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
