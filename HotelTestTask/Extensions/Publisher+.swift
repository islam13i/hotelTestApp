//
//  Publisher+.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 16/12/23.
//

import Combine

extension Publisher {
    func optionalize() -> Publishers.Map<Self, Self.Output?> {
        map({ Optional.some($0) })
    }
}
