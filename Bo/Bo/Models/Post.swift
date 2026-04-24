//
//  Post.swift
//  Bo
//
//  Created by Kazim Ahmad on 24/04/2026.
//

import Foundation

enum MediaType: String, Codable {
    case image
    case video
}

struct Post: Codable {
    let id: Int
    let mediaURL: String
    let description: String
    let date: Date
    let mediaType: MediaType
    
    let episode: Episode
}
