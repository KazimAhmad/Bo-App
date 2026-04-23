//
//  PurpleBackground.swift
//  Bo
//
//  Created by Kazim Ahmad on 23/04/2026.
//

import SwiftUI

struct PurpleBackground: View {
    var showfooter: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                LinearGradient(colors: [Color.accent,
                                        Color.accentColor.opacity(0.8),
                                        Color.accentColor.opacity(0.5),
                                        Color.accentColor.opacity(0.1),
                                        Color.clear],
                               startPoint: .top,
                               endPoint: .bottom)
                .frame(height: geometry.size.height / 2)
                Spacer()
                if showfooter {
                    HStack {
                        Images.diane
                            .resizable()
                            .frame(width: 60, height: 80)
                            .padding(.leading, 120)
                        Images.bojack
                            .resizable()
                            .frame(width: 60, height: 80)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    PurpleBackground()
}
