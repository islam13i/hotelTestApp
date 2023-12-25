//
//  View+.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 24/12/23.
//

import SwiftUI


extension View
{
    @ViewBuilder
    func isHidden(_ hidden: Bool, remove: Bool = false) -> some View
    {
        if hidden
        {
            if !remove { self.hidden() }
        }
        else
        {
            self
        }
    }
}
