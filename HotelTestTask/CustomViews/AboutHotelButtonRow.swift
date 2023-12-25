//
//  AboutHotelButtonRow.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 23/12/23.
//

import SwiftUI

struct AboutHotelButtonRow: View {
    let buttonImage: String
    let buttonName: String
    
    var body: some View {
        HStack {
            Image(buttonImage)
                .resizable()
                .frame(width: 24, height: 24, alignment: .center)
                .scaledToFill()
            
            VStack(alignment: .leading, spacing: 2) {
                Text(buttonName)
                    .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                    .foregroundColor(Color(red: 0.17, green: 0.19, blue: 0.21))
                Text("Самое необходимое")
                    .font(Font.custom("SF Pro Display", size: 14).weight(.medium))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            }
            
            Spacer()
            
            Image("buttonArrow")
                .resizable()
                .frame(width: 6, height: 12)
                .scaledToFit()
        }
        .frame(height: 38)
    }
}


