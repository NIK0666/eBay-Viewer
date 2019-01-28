//
//  NetworkServiceProtocol.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 27/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import Foundation


protocol NetworkServiceProtocol {
    var API_KEY: String { get }
    var host: String { get }
    var api_version: String { get }
}

extension NetworkServiceProtocol {
    var decoder: JSONDecoder {
        return JSONDecoder()
    }
}
