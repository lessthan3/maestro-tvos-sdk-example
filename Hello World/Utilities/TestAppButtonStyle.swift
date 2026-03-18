//
//  TestAppButtonStyle.swift
//  SwiftUI tvOS Test App
//
//  Created by Todd Gibbons on 2/7/25.
//

import SwiftUI

struct ConsoleReadoutButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.isFocused) private var isFocused
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.caption2)
            .foregroundColor(foregroundColor())
            .frame(maxWidth: .infinity)  // This fills the space horizontally
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black.opacity(0.7))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor(), lineWidth: 2)
            )
    }
    
    private func foregroundColor() -> Color {
        if !isEnabled {
            return Color.gray.opacity(0.5)
        }
        return SampleAppUIConstants.consoleTextColor
    }
    
    private func borderColor() -> Color {
        if !isEnabled {
            return Color.gray.opacity(0.5)
        }
        return isFocused ? Color.white : Color.gray.opacity(0.5)
    }
}

struct TestAppButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.isFocused) private var isFocused
    
    var width: CGFloat?
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.caption2)
            .frame(height: 25)
            .frame(width: width != nil ? width! : nil)
            .foregroundColor(foregroundColor())
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(backgroundColor())
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor(), lineWidth: 2)
            )
    }
    
    private func foregroundColor() -> Color {
        return isEnabled ? isFocused ? Color.black : Color.white : Color.gray.opacity(0.5)
    }
    
    private func backgroundColor() -> Color {
        return isFocused ? Color.white : Color.clear
    }
    
    private func borderColor() -> Color {
        return isEnabled ? Color.white : Color.gray.opacity(0.5)
    }
}

struct CheckboxButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.isFocused) private var isFocused
    
    var width: CGFloat?
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.caption2)
            .frame(height: 25)
            .frame(width: width != nil ? width! : nil)
            .foregroundColor(foregroundColor())
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(backgroundColor())
            )
    }
    
    private func backgroundColor() -> Color {
        return isFocused ? Color.white : Color.clear
    }
    
    private func foregroundColor() -> Color {
        return isEnabled ? isFocused ?  Color.black : Color.white : Color.gray.opacity(0.5)
    }
}

struct CheckToggleStyle: ToggleStyle {
    @Environment(\.isEnabled) private var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
    
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack(spacing: 10) {
                Image(systemName: configuration.isOn
                      ? "checkmark.circle.fill"
                      : "circle")
                configuration.label
            }
        }
        .buttonStyle(CheckboxButtonStyle())
    }
}
