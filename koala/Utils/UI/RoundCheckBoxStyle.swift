//
//  RoundCheckBox.swift
//  koala
//
//  Created by 정태훈 on 2021/10/29.
//

import SwiftUI

struct RoundCheckBoxStyle: ToggleStyle {
    var onColor = Color("PrimaryOrange")
    var offColor = Color.clear
    var borderColor = Color("DeactivateIndicatorColor")
    var size: CGFloat = 16
    
    func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            withAnimation(.easeInOut(duration: 0.2)) {
                Circle()
                    .foregroundColor(configuration.isOn ? onColor: offColor)
                    .frame(width: size, height: size)
                    .overlay(
                        Circle()
                            .stroke(configuration.isOn ? onColor:
                                        borderColor, lineWidth: 1)
                    )
            }
        }
    }
}
