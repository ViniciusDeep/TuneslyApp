//
//  HomeModel.swift
//  Tunesly
//
//  Created by Vinicius Mangueira on 22/06/20.
//

import SwiftUI

struct Section: Identifiable, Hashable {
    var id: Int = UUID().hashValue
    var name: String
    
    @State static var defaultSections = [Section(name: "Albums"), Section(name: "Artist"), Section(name: "Playlist"), Section(name: "Songs")]
}

struct AppStore: Decodable {
    let feed: Feed
    
    init() {
        feed = Feed(title: "", id: "", results: [])
    }
}


struct Feed: Decodable {
    let title: String
    let id: String
    let results: [Result]
}

struct Result: Decodable, Identifiable {
    let artistName: String
    let name: String
    let id: String
    let artworkUrl100: String
}
