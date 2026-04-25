//
//  SignUpView.swift
//  Bo
//
//  Created by Kazim Ahmad on 23/04/2026.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            headerView()
            ScrollView {
                VStack(alignment: .leading) {
                    if viewModel.showEmailError {
                        Text("Email is not in correct format")
                            .foregroundStyle(Color.red)
                            .font(AppTypography.regular12())
                    }
                    AppTextField(title: "Email",
                                 text: $viewModel.email)
                    AppTextField(title: "Username",
                                 text: $viewModel.username)
                    AppTextField(title: "Password",
                                 text: $viewModel.password,
                                 isSecure: true)
                    HStack {
                        Button {
                            isPresented = false
                        } label: {
                            Text("Login")
                        }
                        .buttonStyle(YellowAndBlackButton())
                        
                        Button {
                            viewModel.signUp()
                        } label: {
                            Text("Sign Up")
                        }
                        .buttonStyle(PurpleAndWhiteButton())
                    }
                    .padding(.vertical)
                }
                .padding()
            }
        }
        .onChange(of: viewModel.email) { oldValue, newValue in
            viewModel.showEmailError = !newValue.isEmail
        }
    }
    
    func headerView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Images.icon
            Text("A humanoid horse")
                .font(AppTypography.lightApp())
            Text("Bojack Horseman")
                .font(AppTypography.bold(size: 28))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("lost in a sea of self-loathing and booze")
                .font(AppTypography.lightApp())
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    @Previewable @State var isPresented: Bool = true
    SignUpView(isPresented: $isPresented)
}
