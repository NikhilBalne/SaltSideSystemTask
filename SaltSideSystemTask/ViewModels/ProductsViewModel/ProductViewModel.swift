//
//  ProductViewModel.swift
//  SaltSideSystemTask
//
//  Created by Nikhil Balne on 21/11/20.
//

import Foundation

struct ProductViewModel{
    
    func getProducts(completion: @escaping(_ result: [Product]?)-> Void){
        
        HttpUtility.shared.makeApiGetCall(requestUrl: URL(string: ApiEndPoints.products)!, resultType: [Product].self) { (productResult) in
            _ = completion(productResult)
        }
        
    }
}
