//
//  SearchResponse.swift
//  iMusic
//
//  Created by Ivan White on 07.08.2022.
//

import UIKit


struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
    var previewUrl: String?
}
