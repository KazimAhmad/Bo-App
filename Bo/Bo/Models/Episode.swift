//
//  Episode.swift
//  Bo
//
//  Created by Kazim Ahmad on 24/04/2026.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let description: String
    let date: Date
    let rating: Double
    let image: String
    let season: Season
}
