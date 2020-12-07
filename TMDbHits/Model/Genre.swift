//
//  Genre.swift
//  TMDbHits
//
//  Created by Tolga Atmaca on 5.12.2020.
//


import Foundation
import ObjectMapper

struct GenreResult : Mappable {
    var genres : [Genres]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        genres <- map["genres"]
    }
}


struct Genres : Mappable {
    var id : Int?
    var name : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
    }

}
