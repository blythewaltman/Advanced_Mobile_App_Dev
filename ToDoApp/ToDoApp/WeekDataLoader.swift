//
//  WeekDataLoader.swift
//  ToDoApp
//
//  Created by Blythe Waltman on 2/15/21.
//

import Foundation

class WeekDataLoader{
    var allData = [WeekData]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            let plistdecoder = PropertyListDecoder()
            do{
                let data = try Data(contentsOf: pathURL)
                allData = try plistdecoder.decode([WeekData].self, from: data)
            }
            catch{
                print(error)
            }
        }
    }
    
    func getDays() -> [String]{
        var days = [String]()
        for item in allData{
            days.append(item.day)
        }
        return days
    }
    
    func getTasks(index: Int) -> [String]{
        return allData[index].tasks
    }
    
    func addTask(index: Int, newTask: String, newIndex:Int){
        allData[index].tasks.insert(newTask, at: newIndex)
    }
    
    func deleteTask(index: Int, taskIndex: Int){
        allData[index].tasks.remove(at: taskIndex)
    }
}
