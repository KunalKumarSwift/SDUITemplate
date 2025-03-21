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
    func renderVStack(_ component: UIComponent) -> some View {
        VStack {
            if let children = component.children {
                ForEach(children.indices, id: \.self) { index in
                    renderComponent(children[index])
                }
            } else {
                Text("-renderVStack-")
            }
        }
    }

    @ViewBuilder
    func renderText(_ component: UIComponent) -> some View {
        if let content = component.content {
            Text(content)
                .font(parseFont(component.font))
                .foregroundColor(parseColor(component.color))
                .accessibility(label: Text(component.accessibility?.label ?? ""))
        } else {
            Text("-renderText-")
        }
    }

    @ViewBuilder
    func renderButton(_ component: UIComponent) -> some View {
        if let content = component.content, let action = component.action {
            Button(action: {
                viewModel.performAction(named: action)
            }) {
                Text(content)
                    .font(parseFont(component.font))
                    .foregroundColor(parseColor(component.foregroundColor))
            }
            .padding()
            .background(parseColor(component.backgroundColor))
            .cornerRadius(8)
            .accessibility(label: Text(component.accessibility?.label ?? ""))
        } else {
            Text("-renderButton-")
        }
    }

    @ViewBuilder
    func renderDatePicker(_ component: UIComponent) -> some View {
        if let label = component.label {
            DatePicker(label, selection: .constant(Date()))
                .accessibility(label: Text(component.accessibility?.label ?? ""))
        } else {
            Text("-renderDatePicker-")
        }
    }

    @ViewBuilder
    func renderLink(_ component: UIComponent) -> some View {
        if let content = component.content, let urlString = component.url, let url = URL(string: urlString) {
            Link(content, destination: url)
                .font(parseFont(component.font))
                .foregroundColor(parseColor(component.color))
                .accessibility(label: Text(component.accessibility?.label ?? ""))
        } else {
            Text("-renderDatePicker-")
        }
    }

    @ViewBuilder
    func renderChart(_ component: UIComponent) -> some View {
        if let data = component.data {
            VStack {
                ForEach(data, id: \.label) { dataPoint in
                    HStack {
                        Text(dataPoint.label)
                        Spacer()
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: CGFloat(dataPoint.value * 10), height: 20)
                    }
                }
            }
            .accessibility(label: Text(component.accessibility?.label ?? ""))
        } else {
            Text("-renderChart-")
        }
    }

    @ViewBuilder
    func renderForm(_ component: UIComponent) -> some View {
        if let sections = component.sections {
            Form {
                ForEach(sections, id: \.self.header) { section in
                    Section(
                        header: Text(section.header ?? ""),
                        footer: Text(section.footer ?? "")
                    ) {
                        if let children = section.children {
                            ForEach(children, id: \.self.label) { child in
                                renderComponent(child)
                            }
                        }
                    }
                }
            }
            .accessibility(label: Text(component.accessibility?.label ?? ""))
        } else {
            Text("-renderForm-")
        }
    }

    @ViewBuilder
    func renderTextField(_ component: UIComponent) -> some View {
        if let label = component.label, let placeholder = component.placeholder {
            VStack(alignment: .leading) {
                Text(label)
                TextField(placeholder, text: .constant(""))
                    .accessibility(label: Text(component.accessibility?.label ?? ""))
            }
        } else {
            Text("-renderTextField-")
        }
    }

    @ViewBuilder
    func renderPicker(_ component: UIComponent) -> some View {
        if let label = component.label, let options = component.options, let selectedIndex = component.selectedIndex {
            VStack(alignment: .leading) {
                Text(label)
                Picker(label, selection: .constant(selectedIndex)) {
                    ForEach(0..<options.count) { index in
                        Text(options[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .accessibility(label: Text(component.accessibility?.label ?? ""))
            }
        } else {
            Text("-renderPicker-")
        }
    }

    @ViewBuilder
    func renderToggle(_ component: UIComponent) -> some View {
        if let label = component.label, let isOn = component.isOn {
            Toggle(label, isOn: .constant(isOn))
                .accessibility(label: Text(component.accessibility?.label ?? ""))
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
