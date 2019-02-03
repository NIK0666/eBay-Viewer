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

class FindingService: NetworkServiceProtocol {
    
    let keys = EidolonKeys()
    var host: String = "https://svcs.ebay.com/services"
    var api_version: String = "v1"
    var service_version: String = "1.13.0"
    
    func request(by keywords: String, success: @escaping ItemClosure<FindItemsByKeywordsResponse>,  failure: @escaping ItemClosure<Error>) {
        
        let parameters = [
            "OPERATION-NAME": "findItemsByKeywords",
            "SERVICE-VERSION": service_version,
            "SECURITY-APPNAME": keys.ebayAppID,
            "RESPONSE-DATA-FORMAT": "JSON",
            "itemFilter(0).name":"ListingType",
            "itemFilter(0).value(0)":"Auction",
            "keywords": keywords]
        
        
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
    
}
