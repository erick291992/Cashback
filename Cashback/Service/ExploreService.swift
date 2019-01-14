//
//  ExploreService.swift
//  Cashback
//
//  Created by Erick Manrique on 1/13/19.
//  Copyright © 2019 homeapps. All rights reserved.
//

import Foundation

class ExploreService {
    
    let networkService: NetworkService
    let tokenManager: TokenManager
    
    init() {
        self.networkService = NetworkService()
        self.tokenManager = TokenManager()
    }

    
    func getVenues(for city:String = "New York", completion:@escaping(GenericCompletion<VenuesResult>)) {
        let url = Api.CashBack.Venues.url
        let parameters = ["city":city]
        
        let headers = ["token":tokenManager.token!]
        
        networkService.requestData(url: url, parameters: parameters, headers: headers, completion: completion)
    }
    
}
