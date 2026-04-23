//
//  HomeView.swift
//  Bo
//
//  Created by Kazim Ahmad on 23/04/2026.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var audioManager = AudioPlayerManager()
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
            themeSong()
        }
        .padding(.horizontal)
    }
    
    func themeSong() -> some View {
        VStack {
            Slider(
                value: Binding(
                    get: { audioManager.currentTime },
                    set: { audioManager.seek(to: $0) }
                ),
                in: 0...max(audioManager.duration, 1)
            )
            .tint(Color.second)
            HStack {
                Text("Theme Song")
                    .font(AppTypography.light12())
                Spacer()
                if audioManager.currentTime > 0 {
                    Button {
                        audioManager.stop()
                    } label: {
                        Images.stop
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                if audioManager.isPlaying {
                    Button {
                        audioManager.pause()
                    } label: {
                        Images.pause
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                } else {
                    Button {
                        audioManager.playSound(named: "Bojack")
                    } label: {
                        Images.play
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
            }
            .foregroundStyle(Color.primary)
        }
        .padding(.vertical)
    }
}

#Preview {
    HomeView()
}
