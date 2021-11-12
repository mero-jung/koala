//
//  ColoredToggleStyle.swift
//  koala
//
//  Created by 정태훈 on 2021/10/17.
//

import SwiftUI

struct ColoredToggleStyle: ToggleStyle {
    var label = ""
    var labelStyle = Font.title
    var labelColor = Color("PrimaryBlack")
    var onColor = Color(UIColor.green)
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.white
    var onThumbColor: Color? = nil
    var width: CGFloat = 22
    var height: CGFloat = 12
    var radius: CGFloat = 6
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: 0){
            Button(action: { configuration.isOn.toggle() } )
            {
                RoundedRectangle(cornerRadius: radius, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: width, height: height)
                    .overlay(
                        Circle()
                            .fill(configuration.isOn ? (onThumbColor ?? thumbColor) : thumbColor)
                            .padding(1)
                            .offset(x: configuration.isOn ? (10 / 50 * width) : -(10 / 50 * width)))                    .animation(Animation.easeInOut(duration: 0.1))
            }
            Text(label)
                .foregroundColor(labelColor)
                .padding(.leading, 4)
        }
        .font(labelStyle)
    }
}
