//
//  ProductViewModel.swift
//  SaltSideSystemTask
//
//  Created by Nikhil Balne on 21/11/20.
//

import Foundation

struct ProductViewModel{
    
    // MARK: - Method to Hit Api api and gets Data
    func getProducts(completion: @escaping(_ result: [Product]?,Error?,HTTPURLResponse?)-> Void){
        
        HttpUtility.shared.makeApiGetCall(requestUrl: URL(string: ApiEndPoints.products)!, resultType: [Product].self) { (productResult,error,httpUrlResponse) in
            _ = completion(productResult,error,httpUrlResponse)
        }
        
    }
}
