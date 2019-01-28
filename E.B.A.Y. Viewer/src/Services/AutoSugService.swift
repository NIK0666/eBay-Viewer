//
//  AutoSugService.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 27/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//https://autosug.ebay.com/autosugtype?kwd=skyrim&_jgr=1&sId=0&_ch=0&callback=nil

class AutoSugService {
    
    var host: String = "https://autosug.ebay.com/autosug"    
    func request(by keywords: String, success: @escaping ItemClosure<[String]>,  failure: @escaping ItemClosure<Error>) {
        
        let parameters = ["kwd": keywords, "sId": "0", "fmt": "osr"]
        
        Alamofire.request("\(host)", method: .get, parameters:
            parameters).responseJSON { response in
                guard response.result.isSuccess else {
                    failure(response.result.error!)
                    return
                }
                
                do {
                    
                    
                    let json = try JSON(data: response.data!)
                    
                    success(json.array![1].array!.map({ elem -> String in
                        return elem.string!
                    }))
                    
                } catch {
                    failure(error)
                }
        }
        
    }
    
}
