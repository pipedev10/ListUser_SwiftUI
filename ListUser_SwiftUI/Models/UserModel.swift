//
//  User.swift
//  ListUser_SwiftUI
//
//  Created by Pipe Carrasco on 24-05-21.
//

import Foundation
import SwiftUI
import CoreLocation


// MARK: - User
struct UserModel: Hashable, Codable, Identifiable  {
    var id: Int
    var name, username, email: String
    var address: Address
    var phone, website: String
    var company: Company
}

// MARK: - Address
struct Address: Hashable, Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: Double(geo.lat)!,
            longitude: Double(geo.lng)!)
    }
}

// MARK: - Geo
struct Geo: Hashable, Codable {
    let lat, lng: String
    
    
}

// MARK: - Company
struct Company: Hashable, Codable {
    let name, catchPhrase, bs: String
}


//private var coordinates: Coordinates
//var locationCoordinate: CLLocationCoordinate2D {
//    CLLocationCoordinate2D(
//        latitude: coordinates.latitude,
//        longitude: coordinates.longitude)
//}
//
//struct Coordinates: Hashable, Codable {
//    var latitude: Double
//    var longitude: Double
//}
