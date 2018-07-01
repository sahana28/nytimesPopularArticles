//
//  WebServiceHandler.swift
//  NYTimesPopularArticles
//
//  Created by admin on 6/29/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Alamofire

class WebServiceHandler: NSObject {
    
   static func getArticlesArrayFromResponse(success:@escaping (_ articleArray:[Article])-> Void, failure:@escaping (_ errorMessageCode:String) -> Void) {
        
        let requestUrlString = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=55188a7d836b4af3bf23e3d9d486c7fd"
        
        Alamofire.request(requestUrlString, method: .get).responseJSON { response in
            print(response.request as Any)
            print(response.response as Any)
            print(response.result.value as Any)
            
            if let JSON = response.result.value as? NSDictionary {
                let articleDataLayer = ArticlesDataLayer()
                let articleArray = articleDataLayer.getArticles(responseObject: JSON)
                success(articleArray)
            }
            else {
                failure((response.error?.localizedDescription)!)
            }
        }
       
    }

}
