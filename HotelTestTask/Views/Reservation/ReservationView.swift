//
//  ReservationView.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 23/12/23.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

struct ReservationView: View {
    @StateObject private var viewModel = ReservationViewModel()

    @StateObject private var formData = ReservationFormB()
    
    @State private var showingAlert = false
//    @State private var isValidForm: [Bool] = {
//        [self.formData.reservationForm.isValidEmail, self.formData.reservationForm.isValidEmail]
//    }
    var reservation: Reservation {
        viewModel.reservation ?? Reservation()
    }
    
    var finalPrice: String {
        String((viewModel.reservation?.tourPrice ?? 0) + (viewModel.reservation?.fuelCharge ?? 0) + (viewModel.reservation?.serviceCharge ?? 0))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        HStack(spacing: 2) {
                            Image("ratingStar")
                                .resizable()
                                .frame(width: 15, height: 15, alignment: .center)
                                .scaledToFill()
                            Text(String("\(self.reservation.horating ?? 0) \(self.reservation.ratingName ?? "")"))
                                .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                                .foregroundColor(Color(red: 1, green: 0.66, blue: 0))
                        }
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                        .frame(height: 29)
                        .background(Color(red: 1, green: 0.78, blue: 0).opacity(0.20))
                        .cornerRadius(5)
                    }
                    
                    
                    VStack {
                        Text(self.reservation.hotelName ?? "")
                            .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                            .scaledToFill()
                            .lineLimit(1)
                            .foregroundColor(.black)
                            .minimumScaleFactor(0.01)
                        
                        Text(self.reservation.hotelAdress ?? "")
                            .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                            .scaledToFill()
                            .lineLimit(1)
                            .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                            .minimumScaleFactor(0.01)
                            .padding(.top, 8)
                    }
                    
                }
                .padding(.all, 16)
                .background(Color.white)
                .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .top) {
                        Text("Вылет из")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .frame(maxWidth: UIScreen.main.bounds.size.width / 2.5, alignment: .leading)
                        Text(self.reservation.departure ?? "")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(.black)
                            
                        Spacer()
                    }
                    HStack(alignment: .top) {
                        Text("Страна, город")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .frame(maxWidth: UIScreen.main.bounds.size.width / 2.5, alignment: .leading)
                        
                        Text(self.reservation.arrivalCountry ?? "")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    HStack(alignment: .top) {
                        Text("Даты")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .frame(maxWidth: UIScreen.main.bounds.size.width / 2.5, alignment: .leading)
                        
                        Text("\(self.reservation.tourDateStart ?? "") - \(self.reservation.tourDateStop ?? "")")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    HStack(alignment: .top) {
                        Text("Кол-во ночей")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .frame(maxWidth: UIScreen.main.bounds.size.width / 2.5, alignment: .leading)
                        
                        Text(String(self.reservation.numberOfNights ?? 0))
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    HStack(alignment: .top) {
                        Text("Отель")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .frame(maxWidth: UIScreen.main.bounds.size.width / 2.5, alignment: .leading)
                        
                        Text(self.reservation.hotelName ?? "")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    HStack(alignment: .top) {
                        Text("Номер")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .frame(maxWidth: UIScreen.main.bounds.size.width / 2.5, alignment: .leading)
                        
                            Text(self.reservation.room ?? "")
                                .font(Font.custom("SF Pro Display", size: 16))
                                .foregroundColor(.black)
                        Spacer()
                    }
                    HStack(alignment: .top) {
                        Text("Питание")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .frame(maxWidth: UIScreen.main.bounds.size.width / 2.5, alignment: .leading)
                        
                        Text(self.reservation.nutrition ?? "")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
                .padding(.all, 16)
                .background(Color.white)
                .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Информация о покупателе")
                        .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                        .foregroundColor(.black)
                    
                    VStack {
                        
                        FloatingLabelTextField($formData.reservationForm.phoneNumber, validtionChecker: $formData.reservationForm.isValidPhoneNumber, placeholder: "Номер телефона", editingChanged: { (isChanged) in
                        }) {
                            
                        }
                        .addValidations([.init(condition: formData.reservationForm.phoneNumber.count >= 18, errorMessage: "Заполните поле")
                                ]) /// Sets the validation conditions.
                        .isShowError(true)
                        .floatingStyle(ThemeTextFieldStyle())
                        .frame(height: 52)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 5)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.98))
                        .cornerRadius(10)
                        .onChange(of: formData.reservationForm.phoneNumber, perform: { oldValue in
                            formData.reservationForm.phoneNumber = format(with: "+X (XXX) XXX-XX-XX", phone: oldValue)
                                    })
                        
                        FloatingLabelTextField($formData.reservationForm.email, validtionChecker: $formData.reservationForm.isValidEmail, placeholder: "Почта", editingChanged: { (isChanged) in                       
                        }) {
                            
                        }
                        .addValidation(.init(condition: formData.reservationForm.email.isValid(.email), errorMessage: "Неверный формат"))
                        .isShowError(true)
                        .floatingStyle(ThemeTextFieldStyle())
                        .frame(height: 52)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 5)
                        .background(formData.reservationForm.isValidEmail ? Color(red: 0.96, green: 0.96, blue: 0.98) : Color(red: 0.92, green: 0.34, blue: 0.34).opacity(0.15))
                        .cornerRadius(10)
                    }
                    
                    
                    Text("Эти данные никому не передаются. После оплаты мы вышлим чек на указанный вами номер и почту")
                        .font(Font.custom("SF Pro Display", size: 14))
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                        
                }
                .padding(.all, 16)
                .background(Color.white)
                .cornerRadius(15)
                
                
                ForEach((1...self.formData.reservationForm.tourists.count), id: \.self) {index in
                    
                    VStack(alignment: .leading, spacing: 8) {
                            Collapsible(
                                label: {
                                    Text("\(index)-й турист")
                                        .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                                        .foregroundColor(.black)
                                },
                                content: {
                                        ReservationTouristForm(tourist: formData.reservationForm.tourists[index - 1])
                                }
                            )
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.all, 16)
                    .background(Color.white)
                    .cornerRadius(15)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Button(
                        action: { self.formData.reservationForm.tourists.append(ReservationTourist()) },
                        label: {
                            HStack {
                                Text("Добавить туриста")
                                    .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.up")
                                    .frame(width: 32, height: 32)
                                    .background(Color(red: 0.05, green: 0.45, blue: 1, opacity: 0.1))
                                    .cornerRadius(6)
                            }
                            .background(Color.white.opacity(0.01))
                        }
                    )
                }
                .padding(.all, 16)
                .background(Color.white)
                .cornerRadius(15)
                
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .top) {
                        Text("Тур")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .frame(maxWidth: UIScreen.main.bounds.size.width / 2.5, alignment: .leading)
                        Spacer()
                        Text(String(self.reservation.tourPrice ?? 0) + " ₽")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(.black)
                    }
                    HStack(alignment: .top) {
                        Text("Топливный сбор")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .frame(maxWidth: UIScreen.main.bounds.size.width / 2.5, alignment: .leading)
                        Spacer()
                        Text(String(self.reservation.fuelCharge ?? 0) + " ₽")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(.black)
                        
                    }
                    HStack(alignment: .top) {
                        Text("Сервисный сбор")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .frame(maxWidth: UIScreen.main.bounds.size.width / 2.5, alignment: .leading)
                        Spacer()
                        Text(String(self.reservation.serviceCharge ?? 0) + " ₽")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(.black)
                    }
                    HStack(alignment: .top) {
                        Text("К оплате")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .frame(maxWidth: UIScreen.main.bounds.size.width / 2.5, alignment: .leading)
                        Spacer()
                        Text(self.finalPrice + " ₽")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(.black)
                    }
                }
                .padding(.all, 16)
                .background(Color.white)
                .cornerRadius(15)
                
                VStack {
                    Button { 
                        if self.formData.reservationForm.email.isEmpty || self.formData.reservationForm.phoneNumber.isEmpty {
                            showingAlert = true
                            return
                        }
                        let allValid = self.formData.reservationForm.tourists.allSatisfy { tourist in
                            !tourist.firstName.isEmpty &&
                            !tourist.secondName.isEmpty &&
                            !tourist.tbirthday.isEmpty &&
                            !tourist.citizen.isEmpty &&
                            !tourist.numberPassport.isEmpty &&
                            !tourist.expirationPassport.isEmpty
                        }
                        
                        let allBoolValid = self.formData.reservationForm.tourists.allSatisfy { tourist in
                            tourist.isValidfirstName &&
                            tourist.isValidsecondName &&
                            tourist.isValidbirthday &&
                            tourist.isValidcitizen &&
                            tourist.isValidnumberPassport &&
                            tourist.isValidexpirationPassport
                        }
                        
                        if allValid && allBoolValid {
                            
                        } else {
                            showingAlert = true
                            // save function or whatever logic applied when all fields are filled
                            // here we just toggle to show the names on the screen
//                            showSubmittedNames = true
                        }
                    }
                     label: {
                        Text("Оплатить \(self.finalPrice) ₽")
                            .frame(maxWidth: .infinity, maxHeight: 48)
                    }
                    .frame(height: 48)
                    .buttonStyle(.borderedProminent)
                    
                }
                .padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
                .background(Color.white)
            }
            .padding(.top, 8)
            .background(Color(red: 0.96, green: 0.96, blue: 0.98))
            .alert("Important message", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        .onAppear(perform: {
            viewModel.getReservation()
        })
    }
    
    func format(with mask: String, phone: String) -> String {
            let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
            var result = ""
            var index = numbers.startIndex // numbers iterator
            
            // iterate over the mask characters until the iterator of numbers ends
            for ch in mask where index < numbers.endIndex {
                if ch == "X" {
                    // mask requires a number in this place, so take the next one
                    result.append(numbers[index])
                    
                    // move numbers iterator to the next index
                    index = numbers.index(after: index)
                    
                } else {
                    result.append(ch) // just append a mask character
                }
            }
            return result
        }
}

#Preview {
    ReservationView()
}
