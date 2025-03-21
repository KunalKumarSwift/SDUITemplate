//
//  DatePickerView.swift
//  ServerDrivenMultiPlatform
//
//  Created by Kunal Kumar on 2025-03-21.
//

import SwiftUI

struct DatePickerView: View {
    let label: String?
    let accessibilityLabel: String?

    var body: some View {
        if let label = label {
            DatePicker(label, selection: .constant(Date()))
                .accessibility(label: Text(accessibilityLabel ?? ""))
        } else {
            Text("-renderDatePicker-")
        }
    }
}
