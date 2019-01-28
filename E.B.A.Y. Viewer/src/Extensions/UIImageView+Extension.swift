//
//  UIImageView+Extension.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 28/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit
import Alamofire


extension UIImageView {
    
    func setImage( from urlString: String ) {
        Alamofire.request(urlString, method: .get).responseData { responce in
            
            guard responce.error == nil else {
                print(responce.error!.localizedDescription)
                return
            }
            
            self.image = UIImage(data: responce.data!, scale:1)
        }
    }
    
    
}
