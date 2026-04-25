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
        VStack {
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
            List {
                
            }
        }
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel())
}
