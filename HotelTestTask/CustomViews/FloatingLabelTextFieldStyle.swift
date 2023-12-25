//
//  FloatingLabelTextFieldStyle.swift
//  HotelTestTask
//
//  Created by Islam Baigaziev on 24/12/23.
//
//
import SwiftUI
import FloatingLabelTextFieldSwiftUI

struct ThemeTextFieldStyle: FloatingLabelTextFieldStyle {
    func body(content: FloatingLabelTextField) -> FloatingLabelTextField {
        content
            .spaceBetweenTitleText(19) // Sets the space between title and text.
            .textAlignment(.leading) // Sets the alignment for text.
            .titleColor(.gray) // Sets the title color.
            .selectedTitleColor(.gray) // Sets the selected title color.
            .titleFont(.system(size: 12)) // Sets the title font.
            .textColor(.black) // Sets the text color.
            .selectedTextColor(.black) // Sets the selected text color.
            .textFont(.system(size: 16)) // Sets the text font.
            .placeholderColor(.gray) // Sets the placeholder color.
            .placeholderFont(.system(size: 16)) // Sets the placeholder font.
            .errorColor(.red) // Sets the error color.
            .addDisableEditingAction([.paste]) // Disable text field editing action. Like cut, copy, past, all etc.
            .enablePlaceholderOnFocus(true) // Enable the placeholder label when the textfield is focused.
            .allowsHitTesting(true) // Whether this view participates in hit test operations.
            .disabled(false) // Whether users can interact with this.
    }
}
