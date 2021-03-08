//
//  NameDataHandler.swift
//  covidInfo
//
//  Created by Blythe Waltman on 3/5/21.
//

import Foundation

class NameDataHandler {
    
    var names = [String]()
    var onDataUpdate: ((_ data: [String]) -> Void)?
    
    func loadjson(){
        let headers = [
            "x-rapidapi-key": "ccb661f7f7mshe9e373d8f971d4bp1127cajsnbf33eefb2aa0",
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com"
        ]
        
        let urlPath = "https://covid-19-data.p.rapidapi.com/help/countries"
        
        guard let url = URL(string: urlPath)
            else {
                print("url error")
                return
            }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            print(statusCode)
            guard statusCode == 200
                else {
                    print("file download error")
                    return
                }
            //download successful
            print("download complete")
            //parse json asynchronously
            DispatchQueue.main.async {self.parsejson(data!)}
        })
        //must call resume to run session
        session.resume()
    }
    
    func parsejson(_ data: Data){
        do
        {
            let apiData = try JSONDecoder().decode([Name].self, from: data)
            for Name in apiData
            {
                names.append(Name.name)
            }
        }
        
        catch let jsonErr
        {
            print("json error")
            print(jsonErr.localizedDescription)
            return
        }
 
        print("parsejson done")
        //passing the results to the onDataUpdate closure
        onDataUpdate?(names)
    }

    func getNames() -> [String] {
        return names
    }

}
