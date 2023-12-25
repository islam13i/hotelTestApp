//
//  Hotel.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 16/12/23.
//

import Foundation

// MARK: - Hotel
struct Hotel: Codable {
    var id: Int?
    var name, adress: String?
    var minimalPrice: Int?
    var priceForIt: String?
    var rating: Int?
    var ratingName: String?
    var imageUrls: [String]?
    var aboutTheHotel: AboutTheHotel?

    enum CodingKeys: String, CodingKey {
        case id, name, adress
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case rating
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case aboutTheHotel = "about_the_hotel"
    }
}

// MARK: - AboutTheHotel
struct AboutTheHotel: Codable {
    var description: String?
    var peculiarities: [String]?
}
