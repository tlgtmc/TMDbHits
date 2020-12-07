//
//  ApiBase.swift
//  TMDbHits
//
//  Created by Tolga Atmaca on 4.12.2020.
//

import Alamofire
import ObjectMapper

public class ApiBase {
    
    static let Instance = ApiBase()
    
    private func getHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        return headers
    }
    
    func genericCall<T:Mappable>(_ type: T.Type, method: HTTPMethod, URL: String, parameters: [String: Any]?, completion: @escaping (ApiResponse<T>) -> Void) {
        
        let apiResponse = ApiResponse<T>()
        
        call(url: URL, method: method, parameters: parameters) {
            response in

                switch (response.result) {
                    case .success:
                        let mappliable = response.result.value as! [String: Any]
                        apiResponse.status = .success//Commons.ApiResponse.init(rawValue: mappliable["success"] as! Int) ?? Commons.ApiResponse.failure
                        
                        if apiResponse.status == .success {
                            apiResponse.responseObject = Mapper<T>().map(JSON: mappliable)
                        } else {
                            let err = mappliable["content"] as? [String: Any]
                            let errorMessage = err?["message"] as! String
                            let errorCode = err?["errorCode"] as! Int
                            apiResponse.error = errorMessage + " Code: " + String(errorCode)
                        }
                        
                        completion(apiResponse)
                    case .failure( let error):
                        apiResponse.error = error.localizedDescription
                        apiResponse.status = .failure
                        print("Error on request \(error)")
                        completion(apiResponse)
                }
        }
    }
    
    private func call(url: String, method: HTTPMethod, parameters: [String: Any]?, completion: @escaping (DataResponse<Any>) -> Void)  {
        
        if parameters!.count > 0 {
            Alamofire.request(url,
                              method: method,
                              parameters: parameters,
                              encoding: JSONEncoding.default,
                              headers: getHeaders())
                .responseJSON {(response) in
                    completion(response)
            }
        } else {
            Alamofire.request(url,
                              method: method,
                              encoding: JSONEncoding.default,
                              headers: getHeaders())
                .responseJSON {(response) in
                    completion(response)
            }
        }
    }
}
