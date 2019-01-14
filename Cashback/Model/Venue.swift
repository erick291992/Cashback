//
//  Venue.swift
//  Cashback
//
//  Created by Erick Manrique on 1/13/19.
//  Copyright © 2019 homeapps. All rights reserved.
//

import Foundation

class Venue: Codable{
    var id: Int?
    var uuid: String?
    var name: String?
    var city: String?
    var cashback: Double?
    var lat: Double?
    var long: Double?
//    var user_id: Int?
//    var created_at: Date?
//    var updated_at: Date?
}

class VenuesResult: Codable {
    var venues:[Venue]
}

