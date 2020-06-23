//
//  ContentView.swift
//  Tunesly
//
//  Created by Vinicius Mangueira on 22/06/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List(Section.defaultSections) { section in
                Text(section.name).foregroundColor(.pink).font(.system(size: 20, design: .serif))
            }.navigationBarTitle("Library", displayMode: .automatic)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
