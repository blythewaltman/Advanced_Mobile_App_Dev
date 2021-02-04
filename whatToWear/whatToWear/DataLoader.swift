//
//  DataLoader.swift
//  whatToWear
//
//  Created by Blythe Waltman on 2/3/21.
//

import Foundation

class DataLoader {
    var allData = [ClothingOptions]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension:  "plist") {
            //initialize a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                allData = try plistdecoder.decode([ClothingOptions].self, from: data)
            } catch {
                //handle error
                print(error)
            }
        }
    }
    
    func getItems() -> [String]{
        var items = [String]()
        for item in allData {
            items.append(item.name)
        }
        return items
    }
    
    func getOptions(index: Int) -> [String] {
        return allData[index].options
    }
}
