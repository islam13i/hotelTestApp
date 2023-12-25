//
//  PhoneMaskedTextField.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 24/12/23.
//

import SwiftUI

struct PhoneMaskedTextField: View {
    @Binding var phoneNumber: String

        var body: some View {
            TextField("Enter your phone number", text: $phoneNumber, onEditingChanged: { editingChanged in
                if editingChanged {
                    // User started editing, you can customize behavior if needed
                } else {
                    // User finished editing, apply the mask
                    self.applyPhoneNumberMask()
                }
            })
            .keyboardType(.numberPad)
            .padding()
            .border(Color.gray, width: 1)
        }

        private func applyPhoneNumberMask() {
            // Remove non-numeric characters from the phone number
            var cleanedPhoneNumber = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

            // Ensure the phone number is not longer than 10 digits
            if cleanedPhoneNumber.count > 10 {
                cleanedPhoneNumber = String(cleanedPhoneNumber.prefix(10))
            }

            // Apply the phone number mask (e.g., +7 (***) ***-**-**)
            var formattedPhoneNumber = "+7"
            if cleanedPhoneNumber.count >= 1 {
                formattedPhoneNumber += " (\(cleanedPhoneNumber.prefix(3)))"
            }
            if cleanedPhoneNumber.count >= 4 {
                formattedPhoneNumber += " \(cleanedPhoneNumber[cleanedPhoneNumber.index(cleanedPhoneNumber.startIndex, offsetBy: 3)..<cleanedPhoneNumber.index(cleanedPhoneNumber.startIndex, offsetBy: 6)])"
            }
            if cleanedPhoneNumber.count >= 7 {
                formattedPhoneNumber += " \(cleanedPhoneNumber[cleanedPhoneNumber.index(cleanedPhoneNumber.startIndex, offsetBy: 6)..<cleanedPhoneNumber.index(cleanedPhoneNumber.startIndex, offsetBy: 8)])"
            }
            if cleanedPhoneNumber.count >= 9 {
                formattedPhoneNumber += " \(cleanedPhoneNumber.suffix(2))"
            }

            // Update the binding with the formatted phone number
            phoneNumber = formattedPhoneNumber
        }
}

