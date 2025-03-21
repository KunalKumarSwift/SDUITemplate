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
        NavigationView {
            GeometryReader { geometry in  // Capture Geometry of the parent ScrollView
                ScrollView {
                    VStack {
                        ForEach(viewModel.uiComponents.indices, id: \.self) { index in
                            renderComponent(viewModel.uiComponents[index], geometry: geometry)  // Pass Geometry to the child
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .navigationTitle("Dynamic View")
            }
        }
    }

    @ViewBuilder
    func renderComponent(_ component: UIComponent, geometry: GeometryProxy) -> some View {
        switch component.type {
        case "VStack":
            renderVStack(component, geometry: geometry)
        case "Text":
            renderText(component)
        case "Button":
            renderButton(component)
        case "DatePicker":
            renderDatePicker(component)
        case "Link":
            renderLink(component)
        case "Chart":
            renderChart(component, geometry: geometry)
        case "Form":
            renderForm(component, geometry: geometry)
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
