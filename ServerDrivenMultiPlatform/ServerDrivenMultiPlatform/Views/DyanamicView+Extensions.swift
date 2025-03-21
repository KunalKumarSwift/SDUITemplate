//
//  DyanamicView+Extensions.swift
//  ServerDriven
//
//  Created by Kunal Kumar on 2024-07-04.
//

import SwiftUI

// MARK: Render Extensions
extension DynamicView {
    @ViewBuilder
    func renderVStack(_ component: UIComponent, geometry: GeometryProxy) -> some View {
        VStack {
            if let children = component.children {
                ForEach(children.indices, id: \.self) { index in
                    renderComponent(children[index], geometry: geometry)
                }
            } else {
                Text("-renderVStack-")
            }
        }
    }

    @ViewBuilder
    func renderText(_ component: UIComponent) -> some View {
        TextView(
                content: component.content,
                font: parseFont(component.font),
                color: parseColor(component.color),
                accessibilityLabel: component.accessibility?.label
            )
    }

    @ViewBuilder
    func renderButton(_ component: UIComponent) -> some View {
        ButtonView(
                content: component.content,
                action: component.action,
                font: parseFont(component.font),
                foregroundColor: parseColor(component.foregroundColor),
                backgroundColor: parseColor(component.backgroundColor),
                accessibilityLabel: component.accessibility?.label,
                viewModel: viewModel
            )
    }

    @ViewBuilder
    func renderDatePicker(_ component: UIComponent) -> some View {
        DatePickerView(
                label: component.label,
                accessibilityLabel: component.accessibility?.label
            )
    }

    @ViewBuilder
    func renderLink(_ component: UIComponent) -> some View {
        LinkView(
                content: component.content,
                urlString: component.url,
                font: parseFont(component.font),
                color: parseColor(component.color),
                accessibilityLabel: component.accessibility?.label
            )
    }

    @ViewBuilder
    func renderChart(_ component: UIComponent, geometry: GeometryProxy) -> some View {
        if let data = component.data {
            ChartView(data: data, geometry: geometry)
                .accessibility(label: Text(component.accessibility?.label ?? ""))
        } else {
            Text("-renderChart-")
        }
    }

    @ViewBuilder
    func renderForm(_ component: UIComponent, geometry: GeometryProxy) -> some View {
        if let sections = component.sections, !sections.isEmpty {
            FormView(
                sections: sections,
                accessibilityLabel: component.accessibility?.label ?? "Form"
            ) { section in
                AnyView(
                    ForEach(section.children ?? [], id: \.id) { child in
                        renderComponent(child, geometry: geometry)
                    }
                )
            }
        } else {
            Text("-renderForm-")
        }
    }

    @ViewBuilder
    func renderTextField(_ component: UIComponent) -> some View {
        TextFieldView(label: component.label, placeholder: component.placeholder, accessibilityLabel: component.accessibility?.label)
    }

    @ViewBuilder
    func renderPicker(_ component: UIComponent) -> some View {
        if let label = component.label, let options = component.options {
            PickerView(label: label, options: options, initialIndex: component.selectedIndex ?? 0)
        } else {
            Text("-renderPicker-")
        }
    }

    @ViewBuilder
    func renderToggle(_ component: UIComponent) -> some View {
        if let label = component.label, let initialState = component.isOn {
            ToggleView(label: label, initialState: initialState)
        } else {
            Text("-renderToggle-")
        }
    }
}

// MARK: UI Extensions
extension DynamicView {
    func parseFont(_ font: String?) -> Font {
        switch font {
        case "headline":
            return .headline
        case "body":
            return .body
        default:
            return .body
        }
    }

    func parseColor(_ color: String?) -> Color {
        switch color {
        case "primary":
            return .primary
        case "blue":
            return .blue
        case "white":
            return .white
        default:
            return .primary
        }
    }
}
