
import Foundation
import ObjectMapper

struct Crew : Mappable {
	var adult : Bool?
	var gender : Int?
	var id : Int?
	var known_for_department : String?
	var name : String?
	var original_name : String?
	var popularity : Double?
	var profile_path : String?
	var credit_id : String?
	var department : String?
	var job : String?

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
		credit_id <- map["credit_id"]
		department <- map["department"]
		job <- map["job"]
	}

}
