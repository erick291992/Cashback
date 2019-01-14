//
//  Constants.swift
//  Cashback
//
//  Created by Erick Manrique on 1/13/19.
//  Copyright © 2019 homeapps. All rights reserved.
//

import Foundation


let appMode = AppMode.Debug

enum AppMode {
    case Debug
    case Release
}



enum Api {
    enum CashBack: String {
        //        case Url = "consuladob-env.pbdcjvtq9s.us-east-1.elasticbeanstalk.com/api"
        //        case Url = "http://142.93.121.227:3000/api"
        case Url = "https://cashback-explorer-api.herokuapp.com"
        case Users = "/users"
        case Login = "/login"
        case Venues = "/venues"
        var url: String {
            return CashBack.Url.rawValue + self.rawValue
        }
    }
}
