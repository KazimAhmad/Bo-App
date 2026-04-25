//
//  VideoView.swift
//  Bo
//
//  Created by Kazim Ahmad on 24/04/2026.
//

import AVKit
import SwiftUI

struct VideoView: View {
    let videoURL: URL
    @StateObject private var manager = VideoPlayerManager()
    @State var isPaused: Bool = false
    @State var isMuted: Bool = false

    var body: some View {
        ZStack {
            if let player = manager.player {
                PlayerView(player: player)
                    .onTapGesture {
                        if isPaused {
                            manager.play()
                            isPaused = false
                        } else {
                            manager.pause()
                            isPaused = true
                        }
                    }
                pausePlayButton()
                soundButton()
            }
        }
        .onAppear {
            manager.playVideo(url: videoURL)
        }
        .onDisappear {
            manager.pause()
        }
    }
    
    func pausePlayButton() -> some View {
        Group {
            if isPaused {
                Button {
                    manager.play()
                    isPaused = false
                } label: {
                    Images.play
                        .resizable()
                        .foregroundStyle(Color.white)
                        .frame(width: 32, height: 32)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.accent)
                        )
                }
            }
        }
    }
    
    func soundButton() -> some View {
        VStack(alignment: .trailing) {
            Spacer()
            HStack {
                Spacer()
                Button {
                    manager.player?.isMuted.toggle()
                    isMuted.toggle()
                } label: {
                    Group {
                        if isMuted {
                            Images.mute
                        } else {
                            Images.unmute
                        }
                    }
                    .padding(8)
                    .background(
                        Circle()
                            .fill(Color.accent)
                    )
                }
            }
            .foregroundStyle(Color.white)
            .padding(8)
        }
    }
}


#Preview {
    VideoView(videoURL: URL(string: "https://lorem.video/720p")!)
}

struct PlayerView: UIViewRepresentable {
    let player: AVPlayer
    
    func makeUIView(context: Context) -> UIView {
        let view = PlayerContainerView()

        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspect

        view.playerLayer = playerLayer
        view.layer.addSublayer(playerLayer)

        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let container = uiView as? PlayerContainerView {
            if container.playerLayer == nil {
                let layer = AVPlayerLayer(player: player)
                layer.videoGravity = .resizeAspect
                container.layer.addSublayer(layer)
                container.playerLayer = layer
            }
            container.playerLayer?.player = player
            container.setNeedsLayout()
        }
    }
}
final class PlayerContainerView: UIView {
    weak var playerLayer: AVPlayerLayer?

    override func layoutSubviews() {
        super.layoutSubviews()
        // Ensure the player layer always matches the view's bounds
        playerLayer?.frame = bounds
    }
}

