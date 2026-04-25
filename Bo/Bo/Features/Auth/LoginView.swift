//
//  LoginView.swift
//  Bo
//
//  Created by Kazim Ahmad on 23/04/2026.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State var goToSignUp: Bool = false
    
    var body: some View {
        VStack {
            headerView()
            VStack {
                AppTextField(title: "Username",
                             text: $viewModel.username)
                AppTextField(title: "Password",
                             text: $viewModel.password,
                             isSecure: true)
                HStack {
                    Button {
                        goToSignUp = true
                    } label: {
                        Text("Sign Up")
                    }
                    .buttonStyle(YellowAndBlackButton())
                    
                    Button {
                        
                    } label: {
                        Text("Login")
                    }
                    .buttonStyle(PurpleAndWhiteButton())
                }
                .padding(.vertical)
            }
            .padding()
        }
        .navigationDestination(isPresented: $goToSignUp) {
            SignUpView(isPresented: $goToSignUp)
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
    LoginView()
}
