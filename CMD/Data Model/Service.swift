//
//  Service.swift
//  CMD
//
//  Created by A Avinash Chidambaram on 25/06/25.
//

import Foundation

struct Service: Codable {
    var id: UUID
    var name: String
    var code: String
    var description: String
    var averagePrice: Double
    var isActive: Bool
}
