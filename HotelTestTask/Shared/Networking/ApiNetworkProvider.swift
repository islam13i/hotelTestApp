//
//  ApiNetworkProvider.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 16/12/23.
//

import Foundation
import Combine

protocol ApiNetworkProvider {
    func getHotel() -> AnyPublisher<Hotel, Error>
    func getRooms() -> AnyPublisher<Rooms, Error>
    func getReservation() -> AnyPublisher<Reservation, Error>
}

class ApiNetworkClient: ApiNetworkProvider {
    
    var networkClient: NetworkProvider = NetworkClient.instance
    
    func getHotel() -> AnyPublisher<Hotel, Error> {
        networkClient.request(ApiRouter.hotel).decode()
    }
    
    func getRooms() -> AnyPublisher<Rooms, Error> {
        networkClient.request(ApiRouter.rooms).decode()
    }
    
    func getReservation() -> AnyPublisher<Reservation, Error> {
        networkClient.request(ApiRouter.reservation).decode()
    }
}
