//
//  Rooms.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 16/12/23.
//

import Foundation

// MARK: - Welcome
struct Rooms: Codable {
    var rooms: [Room]?
}

// MARK: - Room
struct Room: Codable {
    var id: Int?
    var name: String?
    var price: Int?
    var pricePer: String?
    var peculiarities: [String]?
    var imageUrls: [String]?

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}
