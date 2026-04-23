//
//  RoundedButtonStyle.swift
//  Lemon
//
//  Created by Kazim Ahmad on 08/01/2026.
//

import SwiftUI

struct PurpleAndWhiteButton: ButtonStyle {
    var backgroundColor: Color = .accentColor
    var textColor: Color = .white
    
    var cornerRadius: CGFloat = 28

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppTypography.button())
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .background(
                backgroundColor
                    .opacity(configuration.isPressed ? 0.85 : 1)
            )
            .foregroundColor(textColor)
            .cornerRadius(cornerRadius)
            .shadow(color: .primary.opacity(0.6), radius: 16)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.clear)
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct PurpleBorderButton: ButtonStyle {
    var backgroundColor: Color = .clear
    var borderColor: Color = .accentColor
    var textColor: Color = .accentColor
    
    var cornerRadius: CGFloat = 28
    var borderWidth: CGFloat = 4

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppTypography.button())
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .background(
                backgroundColor
                    .opacity(configuration.isPressed ? 0.85 : 1)
            )
            .foregroundColor(textColor)
            .cornerRadius(cornerRadius)
            .shadow(color: .primary.opacity(0.6), radius: 16)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct YellowAndBlackButton: ButtonStyle {
    var backgroundColor: Color = .second
    var textColor: Color = .black
    
    var cornerRadius: CGFloat = 28

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppTypography.button())
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .background(
                backgroundColor
                    .opacity(configuration.isPressed ? 0.85 : 1)
            )
            .foregroundColor(textColor)
            .cornerRadius(cornerRadius)
            .shadow(color: .primary.opacity(0.6), radius: 16)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.clear)
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct YellowBorderButton: ButtonStyle {
    var backgroundColor: Color = .clear
    var borderColor: Color = .second
    var textColor: Color = .second
    
    var cornerRadius: CGFloat = 28
    var borderWidth: CGFloat = 4

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppTypography.button())
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .background(
                backgroundColor
                    .opacity(configuration.isPressed ? 0.85 : 1)
            )
            .foregroundColor(textColor)
            .cornerRadius(cornerRadius)
            .shadow(color: .primary.opacity(0.6), radius: 16)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}
