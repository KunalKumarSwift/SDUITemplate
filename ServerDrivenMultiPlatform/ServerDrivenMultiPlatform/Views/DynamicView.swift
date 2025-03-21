//
//  DynamicView.swift
//  ServerDriven
//
//  Created by Kunal Kumar on 2024-07-04.
//

import SwiftUI

struct DynamicView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var uiComponents: [UIComponent] = []

    var body: some View {
        VStack {
            //Text("Hellow")
            ForEach(viewModel.uiComponents.indices, id: \.self) { index in
                renderComponent(viewModel.uiComponents[index])
                    .padding()
            }
        }
    }

    @ViewBuilder
    func renderComponent(_ component: UIComponent) -> some View {
        switch component.type {
        case "VStack":
            renderVStack(component)
        case "Text":
            renderText(component)
        case "Button":
            renderButton(component)
        case "DatePicker":
            renderDatePicker(component)
        case "Link":
            renderLink(component)
        case "Chart":
            renderChart(component)
        case "Form":
            renderForm(component)
        case "TextField":
            renderTextField(component)
        case "Picker":
            renderPicker(component)
        case "Toggle":
            renderToggle(component)
        default:
            Text("Loading")
        }
    }
}
