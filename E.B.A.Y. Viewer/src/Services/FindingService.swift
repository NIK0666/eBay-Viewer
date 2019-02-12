//
//  FindingService.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 27/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import Foundation
import Alamofire
import Keys
fileprivate struct FindingResponce: Codable {
    let findItemsByKeywordsResponse: [FindItemsByKeywordsResponse]
}

struct Filter {
    let name: String
    let values: [String]
}



class FindingService: NetworkServiceProtocol {
    
    let keys = EidolonKeys()
    var host: String = "https://svcs.ebay.com/services"
    var api_version: String = "v1"
    var service_version: String = "1.13.0"
    
    private func request(by keywords: String, filters: [String: String], success: @escaping ItemClosure<FindItemsByKeywordsResponse>,  failure: @escaping ItemClosure<Error>) {
        
        var parameters = [
            "OPERATION-NAME": "findItemsByKeywords",
            "SERVICE-VERSION": service_version,
            "SECURITY-APPNAME": keys.ebayAppID,
            "RESPONSE-DATA-FORMAT": "JSON",
            "keywords": keywords]
        
        filters.forEach { key, value in
            parameters[key] = value
        }
        
        
        Alamofire.request("\(host)/search/FindingService/\(api_version)", method: .get, parameters:
            parameters).responseJSON { response in
                guard response.result.isSuccess else {
                    failure(response.result.error!)
                    return
                }
                
                do {
                    let data = try self.decoder.decode(FindingResponce.self, from: response.data!)
                    success(data.findItemsByKeywordsResponse.first!)
                } catch {
                    print(response.request!)
                    failure(error)
                }
        }
    }
    
    func request(by keywords: String, filters: [Filter], success: @escaping ItemClosure<FindItemsByKeywordsResponse>,  failure: @escaping ItemClosure<Error>) {
        
        
        var dict = [String: String]()
        filters.enumerated().forEach { index, filter in
            dict["itemFilter(\(index)).name"] = filter.name
            filter.values.enumerated().forEach({ offset, value in
                dict["itemFilter(\(index)).value(\(offset))"] = value
            })
        }
        
        self.request(by: keywords, filters: dict, success: success, failure: failure)
        
    }
}
