
import Foundation
import ObjectMapper

struct Credits : Mappable, Identifiable {
	var id : Int?
	var cast : [Cast]?
	var crew : [Crew]?

	init?(map: Map) {

	}
    
    init() {
        
    }

	mutating func mapping(map: Map) {

		id <- map["id"]
		cast <- map["cast"]
		crew <- map["crew"]
	}

}
