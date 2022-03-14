//
//  Parsing.swift
//  hw12(Parsing)
//
//  Created by gleba on 10.03.2022.
//

import Foundation

struct parsedata: Codable{
    var info : [parseInfo]?
    var results : [parseResults]?
}
struct parseResults: Codable{
    var name : String = ""
    var status : String = ""
    var species : String = ""
    var location : [parseLocation]?
    var gender : String = ""
//    var firstSeen : String
    var imageURL : String = ""
//    var episodes = NSArray()
    var charURL : String = ""
}

struct parseInfo: Codable{
    var count: Int = 0
    var pages: Int = 0
    var next: String?
    var prev: Bool?
}
struct parseLocation: Codable{
    var name : String = ""
    var url : String = ""
}
