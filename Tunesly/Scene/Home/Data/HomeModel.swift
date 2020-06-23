//
//  HomeModel.swift
//  Tunesly
//
//  Created by Vinicius Mangueira on 22/06/20.
//

import SwiftUI

struct Section: Identifiable {
    var id: Int = UUID().hashValue
    var name: String
    
    @State static var defaultSections = [Section(name: "Albums"), Section(name: "Artist"), Section(name: "Playlist"), Section(name: "Songs")]
}
