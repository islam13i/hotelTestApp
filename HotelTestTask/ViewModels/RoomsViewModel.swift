//
//  RoomsViewModel.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 17/12/23.
//

import Foundation
import Combine

class RoomsViewModel: ObservableObject {
    @Published var rooms: Rooms?
    
    var networkClient: ApiNetworkClient = ApiNetworkClient()

    func getRooms() {
        networkClient.getRooms()
            .optionalize()
            .replaceError(with: nil)
            .assign(to: &$rooms)
    }
}
