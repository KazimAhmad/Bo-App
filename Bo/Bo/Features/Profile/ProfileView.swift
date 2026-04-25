//
//  ProfileView.swift
//  Bo
//
//  Created by Kazim Ahmad on 24/04/2026.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                viewModel.logo
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
                Text("Hello")
                    .font(AppTypography.light(size: 24))
                Spacer()
                Button {
                    viewModel.switchImage()
                } label: {
                    Images.switchObject
                        .resizable()
                        .foregroundStyle(Color.primary)
                        .frame(width: 20, height: 20)
                }
            }
            .padding()
            loggedInView()
            Spacer()
        }
        .foregroundStyle(Color.primary)
    }
    
    func loggedInView() -> some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Bojack Horseman")
                    .font(AppTypography.medium(size: 24))
                Text("thisismyemail@gmail.com")
                    .tint(Color.primary)
                    .font(AppTypography.lightApp())
            }
            .padding()
            List {
                Button {

                } label: {
                    HStack {
                        Text("Saved")
                        Spacer()
                        Images.chevronRight
                    }
                    .font(AppTypography.lightApp())
                }
            }
            VStack {
                HStack {
                    Spacer()
                    Images.diane
                        .resizable()
                        .frame(width: 60, height: 80)
                        .padding(.leading, 120)
                    Images.bojack
                        .resizable()
                        .frame(width: 60, height: 80)
                }
                .padding(.horizontal)
                .padding(.bottom, -8)
                Button {
                    
                } label: {
                    Text("Logout")
                }
                .buttonStyle(YellowAndBlackButton())
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel())
}
