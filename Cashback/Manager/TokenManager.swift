//
//  TokenManager.swift
//  Cashback
//
//  Created by Erick Manrique on 1/13/19.
//  Copyright © 2019 homeapps. All rights reserved.
//

import Foundation
import KeychainSwift
import Alamofire

class TokenManager {
    
    let keychain: KeychainSwift
//    let networkService: NetworkService
    private let tokenKey: String = "CashbackToken"
    
    var token:String? {
        get {
            return keychain.get(tokenKey)
        }
        set {
            if let token = newValue {
                keychain.set(token, forKey: tokenKey)
            } else {
                keychain.delete(tokenKey)
            }
        }
    }
    
    
    func clearTokens() {
        token = nil
    }
    
    
    init() {
        keychain = KeychainSwift()
//        networkService = NetworkService()
    }

}
