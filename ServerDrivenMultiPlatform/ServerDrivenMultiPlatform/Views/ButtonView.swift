//
//  ButtonView.swift
//  ServerDrivenMultiPlatform
//
//  Created by Kunal Kumar on 2025-03-21.
//

import SwiftUI

struct ButtonView: View {
    let content: String?
    let action: String?
    let font: Font?
    let foregroundColor: Color?
    let backgroundColor: Color?
    let accessibilityLabel: String?
    let viewModel: ViewModel // Replace with your actual ViewModel type

    var body: some View {
        if let content = content, let action = action {
            Button(action: {
                viewModel.performAction(named: action)
            }) {
                Text(content)
                    .font(font)
                    .foregroundColor(foregroundColor)
            }
            .padding()
            .background(backgroundColor)
            .cornerRadius(8)
            .accessibility(label: Text(accessibilityLabel ?? ""))
        } else {
            Text("-renderButton-")
        }
    }
}

