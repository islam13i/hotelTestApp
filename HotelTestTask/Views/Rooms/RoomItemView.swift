//
//  RoomItemView.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 23/12/23.
//

import SwiftUI

struct RoomItemView: View {
    //    let buttonImage: String
    //    let buttonName: String
    let room: Room
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                GeometryReader { geometry in
                    ImageCarouselView(numberOfImages: self.room.imageUrls?.count ?? 0) {
                        ForEach(0..<(self.room.imageUrls?.count ?? 0), id: \.self) { index in
                            AsyncImage(url: URL(string: self.room.imageUrls![index])) { image in
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
                
                VStack {
                    Text(self.room.name ?? "")
                        .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                        .scaledToFill()
                        .lineLimit(1)
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.01)
                    
                    
                }
                .padding(.top, 8)
                
                OverflowLayout(spacing: 8) {
                    ForEach((self.room.peculiarities ?? []), id: \.self) { peculiaritie in
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
                
                HStack(spacing: 12) {
                    Text("Подробнее о номере")
                        .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                        .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                        .scaledToFill()
                    Image("blueArrow")
                        .resizable()
                        .frame(width: 6, height: 12)
                        .scaledToFit()
                }
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.10))
                .cornerRadius(5)
                
                HStack {
                    Text("от \(self.room.price ?? 0) ₽")
                        .font(Font.custom("SF Pro Display", size: 22).weight(.semibold))
                        .scaledToFill()
                        .lineLimit(1)
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.01)
                    
                    Text(self.room.pricePer ?? "")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                }
                .padding(.top, 8)
                
                NavigationLink(destination: ReservationView()) {
                    Button { } label: {
                        Text("Выборать номер")
                            .frame(maxWidth: .infinity, maxHeight: 48)
                    }
                    .frame(height: 48)
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding(.all, 16)
            .background(Color.white)
            .cornerRadius(15)
        }
    }
}
struct Room_item_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RoomItemView(room: Room(id: 1, name: "Стандартный с видом на бассейн или сад", price: 186600, pricePer: "За 7 ночей с перелетом", peculiarities: ["Включен только завтрак", "Кондиционер"], imageUrls: ["https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81%20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg", "https://q.bstatic.com/xdata/images/hotel/max1024x768/267647265.jpg?k=c8233ff42c39f9bac99e703900a866dfbad8bcdd6740ba4e594659564e67f191&o=", "https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg"]))
        }
    }
}
