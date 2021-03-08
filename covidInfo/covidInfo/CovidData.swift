//
//  CovidDataHandler.swift
//  covidData
//
//  Created by Blythe Waltman on 3/6/21.
//

import Foundation

struct CovidData : Decodable{
    let country : String
    let confirmed : Int
    let recovered : Int
    let critical : Int
    let deaths : Int
}
