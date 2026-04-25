//
//  PostView.swift
//  Bo
//
//  Created by Kazim Ahmad on 24/04/2026.
//

import AVKit
import Combine
import SwiftUI

struct PostView: View {
    let post: Post
    @State var isBouncing: Bool = false
    let timer = Timer.publish(every: 0.4,
                              on: .main,
                              in: .common).autoconnect()
    
    @State var isBouncingY: Bool = false
    let timerY = Timer.publish(every: 0.6,
                              on: .main,
                              in: .common).autoconnect()
    @State private var videoSize: CGSize = .zero

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                seasonAndEp()
                mediaView(geometry: geometry)
                    .overlay {
                        saveButton()
                    }
                descriptionView()
            }
            .onReceive(timer) { time in
                withAnimation(.easeInOut) {
                    isBouncing.toggle()
                }
            }
            .onReceive(timerY) { time in
                withAnimation(.easeInOut) {
                    isBouncingY.toggle()
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.clear)
                    .stroke(Color.second, lineWidth: 1)
            )
            .padding(8)
        }
    }
    
    func seasonAndEp() -> some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text("S\(post.episode.id).E\(post.episode.id)")
                    .font(AppTypography.mediumApp())
                Text(post.episode.name)
                    .font(AppTypography.light14())
            }
            Spacer()
            Images.starFill
                .resizable()
                .foregroundStyle(Color.second)
                .frame(width: 16, height: 16)
                .padding(.bottom, 2)
            Text(String(post.episode.rating))
                .font(AppTypography.mediumApp())
        }
        .padding(8)
    }
    
    func descriptionView() -> some View {
        VStack(alignment: .leading) {
            Text(post.description)
                .font(AppTypography.light14())
                .lineLimit(2)
            HStack {
                Images.clock
                    .resizable()
                    .frame(width: 16, height: 16)
                Text(post.date.appString)
                    .font(AppTypography.medium14())
            }
            .foregroundStyle(Color.second)
        }
        .padding(8)
    }
    
    func saveButton() -> some View {
        VStack(alignment: .trailing) {
            Spacer()
            HStack {
                Button {
                    
                } label: {
                    Images.bookmark
                        .foregroundStyle(.white)
                        .padding()
                        .background(
                            Circle()
                                .fill(Color.accent)
                        )
                }
                .offset(x: isBouncing ? 2 : 0,
                        y: isBouncingY ? 2 : 0)
                Spacer()
            }
        }
        .padding(8)
    }
    
    func mediaView(geometry: GeometryProxy) -> some View {
        Group {
            if post.mediaType == .image {
                postImageView(geometry: geometry)
            } else if post.mediaType == .video {
                postVideoView(geometry: geometry)
            }
        }
    }
    
    func postImageView(geometry: GeometryProxy) -> some View {
        Group {
            if let imageURL = URL(string: post.mediaURL) {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                        .tint(Color.accent)
                        .frame(width: geometry.size.width,
                               height: geometry.size.height / 2)
                }
            }
        }
    }
    
    func postVideoView(geometry: GeometryProxy) -> some View {
        Group {
            if let videoURL = URL(string: post.mediaURL) {
                ZStack {
                    ProgressView()
                        .foregroundStyle(.accent)
                    VideoView(videoURL: videoURL)
                        .aspectRatio(videoSize.width / videoSize.height, contentMode: .fit)
                        .frame(minWidth: geometry.size.width - 16,
                               minHeight: 120)
                        .onAppear {
                            Task {
                                videoSize = await getVideoSize(url: videoURL)
                            }
                        }
                }
            }
        }
    }
    
    
    @MainActor
    func getVideoSize(url: URL) async -> CGSize {
        let asset = AVURLAsset(url: url)
        do {
            let tracks = try await asset.loadTracks(withMediaType: .video)
            guard let track = tracks.first else { return .zero }
            let naturalSize = try await track.load(.naturalSize)
            let preferredTransform = try await track.load(.preferredTransform)
            let size = naturalSize.applying(preferredTransform)
            return CGSize(width: abs(size.width), height: abs(size.height))
        } catch {
            return .zero
        }
    }
}

#Preview {
    PostView(post: Post(id: 1,
                        mediaURL: "https://picsum.photos/seed/picsum/600/600",
                        description: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for",
                        date: Date(),
                        mediaType: .image,
                        episode: Episode(id: 1,
                                         name: "Episode name it is",
                                         description: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for",
                                         date: Date(),
                                         rating: 8.1,
                                         image: "",
                                         season: Season(id: 1,
                                                        name: "Season 1"))))
}

#Preview {
    PostView(post: Post(id: 1,
                        mediaURL: "https://lorem.video/720p",
                        description: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for",
                        date: Date(),
                        mediaType: .video,
                        episode: Episode(id: 1,
                                         name: "Episode name it is",
                                         description: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for",
                                         date: Date(),
                                         rating: 8.1,
                                         image: "",
                                         season: Season(id: 1,
                                                        name: "Season 1"))))
}
