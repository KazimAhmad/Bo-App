//
//  HomeView.swift
//  Bo
//
//  Created by Kazim Ahmad on 23/04/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            PurpleBackground()
            VStack {
                headerView()
                ScrollView {
                    
                }
            }
        }
    }
    
    func headerView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .bottom) {
                Images.icon
                    .resizable()
                    .frame(width: 48, height: 60)
                Text("A humanoid horse")
                    .font(AppTypography.lightApp())
            }
            Text("Bojack Horseman")
                .font(AppTypography.bold(size: 28))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("lost in a sea of self-loathing and booze")
                .font(AppTypography.lightApp())
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
