//
//  APIServices.swift
//  Cucushka
//
//  Created by hanton on 08/12/2019.
//  Copyright © 2019 hanton. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

final public class APIServices {
    
    public static let shared = APIServices()
    
    
    static let domain = "domain"
    
    static let method = "eventMethod"
    

    // PromiseKit
    func promiseFetchData() -> Promise<DataMortality> {
        return Promise<DataMortality> { seal in
            
            getObject(domain: APIServices.domain, method: APIServices.method, params: ["id" : "F95908B6-492E-4D4A-B780-66E9DFE413E4"])
            {(result : DataMortality?, error: Error?) in
                if let error = error {
                    seal.reject(error)
                } else if let result = result {
                    seal.fulfill(result)
                }
            }
        }
        
    }
    
    
    public func getObject<T:Codable>(
        domain: String,
        method: String,
        params: Parameters,
        handler: @escaping (_ object: T?, _ error: Error?) -> Void) {
        
        let resultURL = domain + method
        
        request(resultURL, parameters: params).responseData(){ response in
            response.result.withValue { data in
                do {
                    let result = try JSONDecoder.init().decode(T.self, from: data)
                    handler(result, nil)
                } catch (let error) {
                    handler(nil, error)
                }
                }.withError { error in
                    handler(nil, error)
            }
        }
    }
    
    public func postObject<T:Codable>(
        domain: String,
        method: String,
        params: Parameters,
        data: T) -> Error? {
        
        let resultURL = domain + method
        request(resultURL, parameters: data as? Parameters)
        return nil
    
        }

    
    
}
