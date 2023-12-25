//
//  ReservationTouristForm.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 25/12/23.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

struct ReservationTouristForm: View {
    @State var tourist: ReservationTourist
    
    var body: some View {
            
            FloatingLabelTextField($tourist.firstName, validtionChecker: $tourist.isValidfirstName, placeholder: "Имя", editingChanged: { (isChanged) in
            }) {
                
            }
            .addValidation(.init(condition: tourist.firstName.isValid(.alphabet), errorMessage: "Поле не должно быть пустым"))
            .isShowError(true)
            .floatingStyle(ThemeTextFieldStyle())
            .frame(height: 52)
            .padding(.horizontal, 16)
            .padding(.vertical, 5)
            .background(tourist.isValidfirstName ? Color(red: 0.96, green: 0.96, blue: 0.98) : Color(red: 0.92, green: 0.34, blue: 0.34).opacity(0.15))
            .cornerRadius(10)
            
            FloatingLabelTextField($tourist.secondName, validtionChecker: $tourist.isValidsecondName, placeholder: "Фамилия", editingChanged: { (isChanged) in
            }) {
                
            }
            .addValidation(.init(condition: tourist.secondName.isValid(.alphabet), errorMessage: "Поле не должно быть пустым"))
            .isShowError(true)
            .floatingStyle(ThemeTextFieldStyle())
            .frame(height: 52)
            .padding(.horizontal, 16)
            .padding(.vertical, 5)
            .background(tourist.isValidsecondName ? Color(red: 0.96, green: 0.96, blue: 0.98) : Color(red: 0.92, green: 0.34, blue: 0.34).opacity(0.15))
            .cornerRadius(10)
            
            FloatingLabelTextField($tourist.tbirthday, validtionChecker: $tourist.isValidbirthday, placeholder: "Дата рождения", editingChanged: { (isChanged) in
            }) {
                
            }
            .addValidation(.init(condition: tourist.tbirthday.isValid(.alphabetNum), errorMessage: "Поле не должно быть пустым"))
            .isShowError(true)
            .floatingStyle(ThemeTextFieldStyle())
            .frame(height: 52)
            .padding(.horizontal, 16)
            .padding(.vertical, 5)
            .background(tourist.isValidbirthday ? Color(red: 0.96, green: 0.96, blue: 0.98) : Color(red: 0.92, green: 0.34, blue: 0.34).opacity(0.15))
            .cornerRadius(10)
            
            FloatingLabelTextField($tourist.citizen, validtionChecker: $tourist.isValidcitizen, placeholder: "Гражданство", editingChanged: { (isChanged) in
            }) {
                
            }
            .addValidation(.init(condition: tourist.citizen.isValid(.alphabet), errorMessage: "Поле не должно быть пустым"))
            .isShowError(true)
            .floatingStyle(ThemeTextFieldStyle())
            .frame(height: 52)
            .padding(.horizontal, 16)
            .padding(.vertical, 5)
            .background(tourist.isValidcitizen ? Color(red: 0.96, green: 0.96, blue: 0.98) : Color(red: 0.92, green: 0.34, blue: 0.34).opacity(0.15))
            .cornerRadius(10)
                        
            FloatingLabelTextField($tourist.numberPassport, validtionChecker: $tourist.isValidnumberPassport, placeholder: "Номер загранпаспорта", editingChanged: { (isChanged) in
            }) {
                
            }
            .addValidation(.init(condition: tourist.numberPassport.isValid(.custom("^[a-zA-Z0-9_.-]*$")), errorMessage: "Поле не должно быть пустым"))
            .isShowError(true)
            .floatingStyle(ThemeTextFieldStyle())
            .frame(height: 52)
            .padding(.horizontal, 16)
            .padding(.vertical, 5)
            .background(tourist.isValidnumberPassport ? Color(red: 0.96, green: 0.96, blue: 0.98) : Color(red: 0.92, green: 0.34, blue: 0.34).opacity(0.15))
            .cornerRadius(10)
            
           
            FloatingLabelTextField($tourist.expirationPassport, validtionChecker: $tourist.isValidexpirationPassport, placeholder: "Срок действия загранпаспорта", editingChanged: { (isChanged) in
            }) {
                
            }
            .addValidation(.init(condition: tourist.expirationPassport.isValid(.custom("^[a-zA-Z0-9_.-]*$")), errorMessage: "Поле не должно быть пустым"))
            .isShowError(true)
            .floatingStyle(ThemeTextFieldStyle())
            .frame(height: 52)
            .padding(.horizontal, 16)
            .padding(.vertical, 5)
            .background(tourist.isValidexpirationPassport ? Color(red: 0.96, green: 0.96, blue: 0.98) : Color(red: 0.92, green: 0.34, blue: 0.34).opacity(0.15))
            .cornerRadius(10)
    }
}

//#Preview {
//    ReservationTouristForm(ReservationTourist())
//}
