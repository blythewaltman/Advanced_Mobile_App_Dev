//
//  AestheticsDataLoader.swift
//  Aesthetica
//
//  Created by Blythe Waltman on 3/2/21.
//

import Foundation


class AestheticsDataLoader{
    var allData = [AestheticsData]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                allData = try plistdecoder.decode([AestheticsData].self, from: data)
            } catch {
                // handle error
                print(error)
            }
        }
    }
    
    func getAesthetics() -> [String]{
        var aesthetics = [String]()
        for item in allData{
            aesthetics.append(item.name)
        }
        return aesthetics
    }
    
    func getImages(index:Int) -> [String] {
        return allData[index].images
    }
    
}
