//
//  HotelRoomViewModel.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 17/12/23.
//

import Foundation
import Combine

class ReservationViewModel: ObservableObject {
    @Published var reservation: Reservation?
    
//    @Published var id: Int?
//    @Published var name: String?
//    @Published var adress: String?
//    @Published var minimalPrice: Int?
//    @Published var priceForIt: String?
//    @Published var rating: Int?
//    @Published var ratingName: String?
//    @Published var imageUrls: [String]?
//    @Published var aboutTheHotel: AboutTheHotel?
    
    var networkClient: ApiNetworkClient = ApiNetworkClient()

    func getReservation() {
        networkClient.getReservation()
            .optionalize()
            .replaceError(with: nil)
            .assign(to: &$reservation)
    }
}
