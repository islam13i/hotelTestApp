//
//  ReservationForm.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 25/12/23.
//

import Foundation


struct ReservationForm {
    var phoneNumber = ""
    var isValidPhoneNumber: Bool = true
    var email = ""
    var isValidEmail: Bool = true
    var tourists: [ReservationTourist] = [ReservationTourist()]
}
struct ReservationTourist {
    var firstName = ""
    var secondName = ""
    var tbirthday = ""
    var citizen = ""
    var numberPassport = ""
    var expirationPassport = ""
    var isValidfirstName: Bool = true
    var isValidsecondName: Bool = true
    var isValidbirthday: Bool = true
    var isValidcitizen: Bool = true
    var isValidnumberPassport: Bool = true
    var isValidexpirationPassport: Bool = true
    
}

class ReservationFormB: ObservableObject{
  @Published var reservationForm = ReservationForm()
}
