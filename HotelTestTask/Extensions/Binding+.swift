//
//  Binding+.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 20/12/23.
//

import SwiftUI

extension Binding {
    func map<MappedValue>(
        valueToMappedValue: @escaping (Value) -> MappedValue,
        mappedValueToValue: @escaping (MappedValue) -> Value
    ) -> Binding<MappedValue> {
        Binding<MappedValue>.init { () -> MappedValue in
            return valueToMappedValue(wrappedValue)
        } set: { mappedValue in
            wrappedValue = mappedValueToValue(mappedValue)
        }
    }
    
    func onSet(_ action: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding { () -> Value in
            return wrappedValue
        } set: { value in
            action(value)
            wrappedValue = value
        }
    }
}

func ??<T>(binding: Binding<T?>, fallback: T) -> Binding<T> {
    return Binding(get: {
        binding.wrappedValue ?? fallback
    }, set: {
        binding.wrappedValue = $0
    })
}
