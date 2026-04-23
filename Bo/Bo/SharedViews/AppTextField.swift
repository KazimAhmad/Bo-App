//
//  AppTextField.swift
//  Bo
//
//  Created by Kazim Ahmad on 23/04/2026.
//

import SwiftUI

struct AppTextField: View {
    @State var title: String
    @State var text: Binding<String>
    let isSecure: Bool
    
    init (title: String = "Title",
          text: Binding<String> = .constant(""),
          isSecure: Bool = false) {
        self.text = text
        self.title = title
        self.isSecure = isSecure
    }
    
    var body: some View {
        if isSecure {
            SecureField(title, text: text)
                .textFieldStyle(.plain)
                .autocorrectionDisabled()
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16.0)
                        .fill(Color.clear)
                        .stroke(Color.second, lineWidth: 1.0)
                )
        } else {
            TextField(title, text: text)
                .textFieldStyle(.plain)
                .autocorrectionDisabled()
                .font(AppTypography.mediumApp())
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16.0)
                        .fill(Color.clear)
                        .stroke(Color.second, lineWidth: 1.0)
                )
        }
    }
}

#Preview {
    AppTextField()
}

struct AppTextView: View {
    @State var title: String
    @State var text: Binding<String>
    
    init (title: String = "Title",
          text: Binding<String> = .constant("")) {
        self.text = text
        self.title = title
    }
    
    var body: some View {
        TextField(title, text: text,  axis: .vertical)
            .lineLimit(8...10)
            .autocorrectionDisabled()
            .font(AppTypography.mediumApp())
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.clear)
                    .stroke(Color.second, lineWidth: 1)
            )
    }
}
