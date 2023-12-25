//
//  RoomsView.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 23/12/23.
//

import SwiftUI

struct RoomsView: View {
    @StateObject private var viewModel = RoomsViewModel()
    
    var rooms: [Room] {
        viewModel.rooms?.rooms ?? [Room]()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(self.rooms, id: \.id) { room in
                    RoomItemView(room: room).padding(.bottom, 8)
                }
            }
            .padding(.top, 8)
            .background(Color(red: 0.96, green: 0.96, blue: 0.98))
        }        
        .navigationBarTitle("Profile", displayMode: .inline)
        .onAppear(perform: {
            viewModel.getRooms()
        })
    }
}

struct Rooms_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView()
    }
}
