//
//  ExpandableView.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 24/12/23.
//

import SwiftUI

struct Collapsible<Content: View>: View {
    @State var label: () -> Text
    @State var content: () -> Content
    
    @State private var collapsed: Bool = false
    
    var body: some View {
        VStack {
            Button(
                action: { self.collapsed.toggle() },
                label: {
                    HStack {
                        self.label()
                        Spacer()
                        Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                            .frame(width: 32, height: 32)
                            .background(Color(red: 0.05, green: 0.45, blue: 1, opacity: 0.1))
                            .cornerRadius(6)
                    }
//                    .padding(.bottom, 1)
                    .background(Color.white.opacity(0.01))
                }
            )            
            
            VStack {
                self.content()
            }
            .allowsHitTesting(self.collapsed ? false : true)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .animation(Animation.easeInOut(duration: 1.0), value: collapsed ? 0 : 0)
            .transition(.slide)
        }
    }
}


//#Preview {
//    ExpandableView()
//}
