
//
//  Movies.swift
//  TMDbHits
//
//  Created by Tolga Atmaca on 4.12.2020.
//

import Foundation
import ObjectMapper

struct MovieResult: Mappable {
	var page : Int?
	var results : [Movie]?
	var total_pages : Int?
	var total_results : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		page <- map["page"]
		results <- map["results"]
		total_pages <- map["total_pages"]
		total_results <- map["total_results"]
	}

}
