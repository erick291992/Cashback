//
//  LoginViewControllerViewModel.swift
//  Cashback
//
//  Created by Erick Manrique on 1/13/19.
//  Copyright © 2019 homeapps. All rights reserved.
//

import Foundation

class LoginViewControllerViewModel:AlertGenerator {
    
    let userService: UserService
    let tokenManager: TokenManager
    var onSuccessFullLogin: (() -> Void)?
    var onShowError: ((_ alert: SingleButtonAlert) -> Void)?
    
    init() {
        self.userService = UserService()
        self.tokenManager = TokenManager()
    }
    
    func checkAndRedirect() {
        if tokenManager.token != nil {
            onSuccessFullLogin?()
        }
    }
    
    func loginUser(with name:String, and email:String) {
        
        userService.loginUser(name: name, email: email) { (result) in
            
        }
    }
    
    func createUser(with name:String, and email:String) {
        
        userService.createUser(name: name, email: email) { [weak self] (result) in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(_, let headers):

                if let token = headers["Token"] as? String {
                    strongSelf.tokenManager.token = token
                    strongSelf.onSuccessFullLogin?()
                    return
                } else {
                    let alert = strongSelf.generataAlert(alertTitle: "error", statusCodeMessage: "create user failed")
                    strongSelf.onShowError?(alert)
                }
            case .failure(_):
                print("error in create")
                let alert = strongSelf.generataAlert(alertTitle: "failure", statusCodeMessage: "responce caused error")
                strongSelf.onShowError?(alert)
            }
        }
    }
    
}
