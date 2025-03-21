//
//  FormView.swift
//  ServerDrivenMultiPlatform
//
//  Created by Kunal Kumar on 2025-03-21.
//

import SwiftUI

struct FormView: View {
    let sections: [UIComponent]
    let accessibilityLabel: String?

    @ViewBuilder let renderChildren: (UIComponent) -> AnyView

    var body: some View {
        VStack {
            ForEach(sections, id: \.id) { section in
                Section(
                    header: Text(section.header ?? "No Header"),  // Provide fallback header text
                    footer: Text(section.footer ?? "No Footer")   // Provide fallback footer text
                ) {
                    renderChildren(section)
                }
            }
        }
        .padding()
        .cornerRadius(12)  // Rounded corners for the form container
        .shadow(radius: 5)  // Optional shadow to make it pop
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.blue, lineWidth: 2)  // Border color and width
        )
        .accessibility(label: Text(accessibilityLabel ?? "Form"))

    }
}
