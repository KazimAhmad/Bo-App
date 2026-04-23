//
//  SignUpView.swift
//  Bo
//
//  Created by Kazim Ahmad on 23/04/2026.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack {
            headerView()
            VStack {
                AppTextField(title: "Email",
                             text: $viewModel.username)
                AppTextField(title: "Username",
                             text: $viewModel.username)
                AppTextField(title: "Password",
                             text: $viewModel.password,
                             isSecure: true)
                HStack {
                    Button {
                        
                    } label: {
                        Text("Login")
                    }
                    .buttonStyle(YellowAndBlackButton())
                    
                    Button {
                        
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
    SignUpView()
}
