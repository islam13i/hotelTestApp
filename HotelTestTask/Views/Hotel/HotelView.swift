//
//  ContentView.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 16/12/23.
//

import SwiftUI

struct HotelView: View {
    @StateObject private var viewModel = HotelViewModel()
    
    var hotel: Hotel {
        viewModel.hotel ?? Hotel()
    }
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 8) {
                    GeometryReader { geometry in
                        ImageCarouselView(numberOfImages: self.hotel.imageUrls?.count ?? 0) {
                            ForEach(0..<(self.hotel.imageUrls?.count ?? 0), id: \.self) { index in
                                AsyncImage(url: URL(string: self.hotel.imageUrls![index])) { image in
                                    if let image = image.image { // 2
                                        // if the image is valid
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .clipped()
                                    } else if image.error != nil { // 3
                                        // some kind of error appears
                                        Text("No image available")
                                    } else {
                                        //appears as placeholder image
                                        Image(systemName: "square.and.arrow.down") // 4
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .clipped()
                                    }}
                            }
                        }
                        .cornerRadius(15)
                    }
                    .frame(height: 250, alignment: .center)
                    
                    HStack {
                        HStack(spacing: 2) {
                            Image("ratingStar")
                                .resizable()
                                .frame(width: 15, height: 15, alignment: .center)
                                .scaledToFill()
                            Text(String("\(self.hotel.rating ?? 0) \(self.hotel.ratingName ?? "")"))
                                .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                                .foregroundColor(Color(red: 1, green: 0.66, blue: 0))
                        }
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                        .frame(height: 29)
                        .background(Color(red: 1, green: 0.78, blue: 0).opacity(0.20))
                        .cornerRadius(5)
                    }
                    .padding(.top, 8)
                    
                    VStack {
                        Text(self.hotel.name ?? "")
                            .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                            .scaledToFill()
                            .lineLimit(1)
                            .foregroundColor(.black)
                            .minimumScaleFactor(0.01)
                        
                        Text(self.hotel.adress ?? "")
                            .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                            .scaledToFill()
                            .lineLimit(1)
                            .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                            .minimumScaleFactor(0.01)
                            .padding(.top, 8)
                    }
                    .padding(.top, 8)
                    
                    HStack {
                        Text("от \(self.hotel.minimalPrice ?? 0) ₽")
                            .font(Font.custom("SF Pro Display", size: 22).weight(.semibold))
                            .scaledToFill()
                            .lineLimit(1)
                            .foregroundColor(.black)
                            .minimumScaleFactor(0.01)
                        
                        Text("за тур с перелётом")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                    
                    
                }
                .padding(.horizontal, 16)
                .background(Color.white)
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 12,
                        bottomTrailingRadius: 12,
                        topTrailingRadius: 0
                    )
                )
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Об отеле")
                        .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                        .foregroundColor(.black)
                    
                    OverflowLayout(spacing: 8) {
                        ForEach((self.hotel.aboutTheHotel?.peculiarities ?? []), id: \.self) { peculiaritie in
                            HStack(spacing: 2) {
                                Text(peculiaritie)
                                    .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            }
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .frame(height: 29)
                            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                            .cornerRadius(5)
                        }
                    }
                    .padding(.top, 4)
                    
                    Text(self.hotel.aboutTheHotel?.description ?? "")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(Color(red: 0, green: 0, blue: 0).opacity(0.90))
                    
                    VStack(alignment: .leading) {
                        AboutHotelButtonRow(buttonImage: "emoji-happy", buttonName: "Удобство")
                        
                        Color.gray
                            .frame(height: 1 / UIScreen.main.scale)
                            .padding(.leading, 36)
                        
                        AboutHotelButtonRow(buttonImage: "tick-square", buttonName: "Что включено")
                        
                        Color.gray
                            .frame(height: 1 / UIScreen.main.scale)
                            .padding(.leading, 36)
                        
                        AboutHotelButtonRow(buttonImage: "close-square", buttonName: "Что не включено")
                    }
                    .padding(.all, 15)
                    .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .background(Color.white)
                .cornerRadius(12)
                
                VStack {
                    Button { } label: {
                        Text("К выбору номера")
                            .frame(maxWidth: .infinity, maxHeight: 48)
                    }
                    .frame(height: 48)
                    .buttonStyle(.borderedProminent)
                    
                }
                .padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
                .background(Color.white)
            }
            .background(Color(red: 0.96, green: 0.96, blue: 0.98))
            .navigationBarTitle("Profile", displayMode: .inline)
        }
        .onAppear(perform: {
            viewModel.getHotel()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView()
    }
}
