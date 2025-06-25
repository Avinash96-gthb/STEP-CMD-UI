//
//  Clinic.swift
//  CMD
//
//  Created by A Avinash Chidambaram on 25/06/25.
//

import Foundation

struct Clinic: Codable {
    var id: UUID
    var name: String
    var businessName: String
    var streetAddress: String
    var city: String
    var state: String
    var country: String
    var zipCode: String
    var latitude: Double
    var longitude: Double
    var dateCreated: Date
    var services: [Service]
}
