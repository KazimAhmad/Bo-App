//
//  FlyingBojack.swift
//  Bo
//
//  Created by Kazim Ahmad on 22/04/2026.
//

import SwiftUI

struct FlyingBojack: View {
    @State private var isAnimating: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("bojack_flying")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .offset(x: isAnimating ? geometry.size.width : 0,
                            y: isAnimating ? 0 : geometry.size.width)
            }
        }
        .onAppear {
            Task { @MainActor in
                try await Task.sleep(for: .seconds(0.1))
                withAnimation(.linear(duration: 6).repeatForever(autoreverses: false)) {
                    isAnimating.toggle()
                }
            }
        }
    }
}

#Preview {
    FlyingBojack()
}
