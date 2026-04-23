//
//  FlyingBojack.swift
//  Bo
//
//  Created by Kazim Ahmad on 22/04/2026.
//

import Combine
import SwiftUI

struct FlyingBojack: View {
    @State private var isAnimating: Bool = false
    @State private var isBouncing: Bool = false

    let flyingTime = Timer.publish(every: Constants.flyingBojackAnimationTime,
                                   on: .main,
                                   in: .common).autoconnect()
    @Binding var isActive: Bool
    
    var body: some View {
        GeometryReader { geometry in
            Color.clear.edgesIgnoringSafeArea(.all)
            ZStack {
                bubble(offset: geometry.size.width)
                Images.flyingBojack
                    .resizable()
                    .frame(width: 200, height: 200)
                    .offset(x: isAnimating ? geometry.size.width : -100,
                            y: isAnimating ? 0 : geometry.size.width)
            }
        }
        .disabled(true)
        .onAppear {
            Task { @MainActor in
                try await Task.sleep(for: .seconds(0.1))
                withAnimation(.linear(duration: Constants.flyingBojackAnimationTime).repeatForever(autoreverses: false)) {
                    isAnimating.toggle()
                }
                withAnimation(.linear(duration: Constants.bubbleBounceTime).repeatForever()) {
                    isBouncing.toggle()
                }
            }
        }
        .onReceive(flyingTime) { _ in
            isActive = false
        }
    }
    
    func bubble(offset: CGFloat) -> some View {
        VStack {
            Images.bubble
                .resizable()
                .frame(width: 48, height: 48)
                .offset(x: isAnimating ? offset : 0,
                        y: isBouncing ? offset/2 : -8)
        }
    }
}

#Preview {
    @Previewable @State var isActive: Bool = false
    FlyingBojack(isActive: $isActive)
}
