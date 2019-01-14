//
//  UserService.swift
//  Cashback
//
//  Created by Erick Manrique on 1/13/19.
//  Copyright © 2019 homeapps. All rights reserved.
//

import Foundation

class UserService {

    let networkService: NetworkService
    let tokenManager: TokenManager
    
    init() {
        self.networkService = NetworkService()
        self.tokenManager = TokenManager()
    }
    
    // Mark:- Login User
    func loginUser(name:String , email:String, completion:@escaping(EmptyRequestCompletion)) {
        let url = Api.CashBack.Login.url
        let parameters = ["name":name,
                          "email":email]
        
        var headers = [String:String]()
        headers["token"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVyaWNrMUBnbWFpbC5jb20iLCJpYXQiOjE1NDc0MTU5MTUsImV4cCI6MTU1MDAwNzkxNX0.YmC5uG4rvssBlxRO299gfhtDfwlK40CMINakBG8NBVg"
        
        
        networkService.requestEmpty(url: url,parameters: parameters, completion: completion)
        
    }
    
    func createUser(name:String , email:String, completion:@escaping(EmptyRequestCompletion)) {
        let url = Api.CashBack.Users.url
        let parameters = ["name":name,
                          "email":email]
        
        //        var headers = [String:String]()
        //        headers["token"] = self.tokenManager.token!
        
        networkService.requestEmpty(url: url,parameters: parameters, method:.post, completion: completion)
        
    }
    
}
