//
//  Reservation.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 16/12/23.
//

import Foundation

// MARK: - Welcome
struct Reservation: Codable {
    var id: Int?
    var hotelName, hotelAdress: String?
    var horating: Int?
    var ratingName, departure, arrivalCountry, tourDateStart: String?
    var tourDateStop: String?
    var numberOfNights: Int?
    var room, nutrition: String?
    var tourPrice, fuelCharge, serviceCharge: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case hotelName = "hotel_name"
        case hotelAdress = "hotel_adress"
        case horating
        case ratingName = "rating_name"
        case departure
        case arrivalCountry = "arrival_country"
        case tourDateStart = "tour_date_start"
        case tourDateStop = "tour_date_stop"
        case numberOfNights = "number_of_nights"
        case room, nutrition
        case tourPrice = "tour_price"
        case fuelCharge = "fuel_charge"
        case serviceCharge = "service_charge"
    }
}
