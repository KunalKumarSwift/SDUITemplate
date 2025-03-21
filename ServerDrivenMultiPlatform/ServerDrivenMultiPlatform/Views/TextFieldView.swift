//
//  VStackView.swift
//  ServerDrivenMultiPlatform
//
//  Created by Kunal Kumar on 2025-03-21.
//

import SwiftUI

struct TextFieldView: View {
    let label: String?
    let placeholder: String?
    let accessibilityLabel: String?

    var body: some View {
        if let label = label, let placeholder = placeholder {
            VStack(alignment: .leading) {
                Text(label)
                TextField(placeholder, text: .constant(""))
                    .accessibility(label: Text(accessibilityLabel ?? ""))
            }
        } else {
            Text("-renderTextField-")
        }
    }
}
