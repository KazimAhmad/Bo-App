//
//  VideoPlayerManager.swift
//  Bo
//
//  Created by Kazim Ahmad on 24/04/2026.
//

import AVKit
import Combine

class VideoPlayerManager: ObservableObject {
    @Published var player: AVPlayer?
    
    private var looper: AVPlayerLooper?
    private var queuePlayer: AVQueuePlayer?
    
    func playVideo(url: URL) {
        let item = AVPlayerItem(url: url)
        
        queuePlayer = AVQueuePlayer()
        looper = AVPlayerLooper(player: queuePlayer!, templateItem: item)
        
        player = queuePlayer
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
    
    func play() {
        player?.play()
    }
}
