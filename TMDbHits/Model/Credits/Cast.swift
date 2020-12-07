

import Foundation
import ObjectMapper

struct Cast : Mappable, Identifiable {
	var adult : Bool?
	var gender : Int?
	var id : Int?
	var known_for_department : String?
	var name : String?
	var original_name : String?
	var popularity : Double?
	var profile_path : String?
	var cast_id : Int?
	var character : String?
	var credit_id : String?
	var order : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		adult <- map["adult"]
		gender <- map["gender"]
		id <- map["id"]
		known_for_department <- map["known_for_department"]
		name <- map["name"]
		original_name <- map["original_name"]
		popularity <- map["popularity"]
		profile_path <- map["profile_path"]
		cast_id <- map["cast_id"]
		character <- map["character"]
		credit_id <- map["credit_id"]
		order <- map["order"]
	}

}
