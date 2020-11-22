//
//  HttpUtility.swift
//  SaltSideSystemTask
//
//  Created by Nikhil Balne on 21/11/20.
//

import Foundation

// MARK: - HttpUtality class for Server Calls
class HttpUtility {
    
    static let shared : HttpUtility = HttpUtility()
    
    private init(){}
    
    func makeApiGetCall<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void){
        
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            
            if(error == nil && responseData != nil && responseData?.count != 0){
            
                do {
                    let result = try JSONDecoder().decode(T.self, from: responseData!)
                    _ = completionHandler(result)
                
                }catch let error{
                    debugPrint("error occured while decoding = \(error)")
                }
            }

        }.resume()
    }

}
