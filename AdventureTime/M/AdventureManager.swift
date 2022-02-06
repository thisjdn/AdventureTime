//
//  AdventureManager.swift
//  AdventureTime
//
//  Created by Jaden Hong on 2022-02-02.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol AdventureManagerDelegate {
    func didUpdateDisplay(_ activity: String)
}

struct AdventureManager {
    
    let url = "http://www.boredapi.com/api/activity/"
    
    let perams : [String : String] = [
        "activity" : "activity"
    
    ]
    
    var delegate : AdventureManagerDelegate?
    
    
    func performRequest() {
        AF.request("http://www.boredapi.com/api/activity/").response { response in
            switch response.result {
            case .success(let value) :
                let dataJSON : JSON = JSON(value!)
                let dataActivity = dataJSON["activity"].stringValue
                print(dataActivity)
                delegate?.didUpdateDisplay(dataActivity)
                
            case .failure(let error):
                print("Switch statements failed : \(error)")
            }
        }
    }
    
     
}
