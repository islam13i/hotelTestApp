//
//  HotelViewModel.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 16/12/23.
//

import Foundation
import Combine

class HotelViewModel: ObservableObject {
    @Published var hotel: Hotel?
    
//    @Published var name: String?
//    @Published var adress: String?
//    @Published var minimalPrice: Int?
//    @Published var priceForIt: String?
//    @Published var rating: Int?
//    @Published var ratingName: String?
//    @Published var imageUrls: [String]?
//    @Published var aboutTheHotel: AboutTheHotel?
    
    var networkClient: ApiNetworkClient = ApiNetworkClient()
    
    init() {
        bind()
    }
    
    private func bind() {
//        $hotel.map({ $0?.id }).assign(to: &$id)
//        $hotel.map({ $0?.name }).assign(to: &$name)
//        $hotel.map({ $0?.adress }).assign(to: &$adress)
//        $hotel.map({ $0?.minimalPrice }).assign(to: &$minimalPrice)
//        $hotel.map({ $0?.priceForIt }).assign(to: &$priceForIt)
//        $hotel.map({ $0?.rating }).assign(to: &$rating)
//        $hotel.map({ $0?.ratingName }).assign(to: &$ratingName)
//        $hotel.map({ $0?.imageUrls }).assign(to: &$imageUrls)
//        $hotel.map({ $0?.aboutTheHotel }).assign(to: &$aboutTheHotel)

    }
    
    func getHotel() {
        networkClient.getHotel()
            .optionalize()
            .replaceError(with: nil)
            .assign(to: &$hotel)
        print("Receive hotel")
    }
}
