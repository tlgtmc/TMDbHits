//
//  ApiResponse.swift
//  TMDbHits
//
//  Created by Tolga Atmaca on 5.12.2020.
//

public class ApiResponse<T> {
    //public var responseList: [Any?] = []
    var responseObject: T? = nil
    public var status: Commons.ApiResponse = .failure
    public var error: String = ""
}
