//
//  TuneslyApp.swift
//  Tunesly
//
//  Created by Vinicius Mangueira on 22/06/20.
//

import SwiftUI

@main
struct TuneslyApp: App {
    
    @State private var recomendationArtist = Feed(title: "", id: "", results: [])
    
    var body: some Scene {
        WindowGroup {
            #if APPCLIP
            NavigationView {
                SmothClipView()
            }
            .environmentObject(recomendationArtist)
            .onContinueUserActivity(NSUserActivityTypeBrowsingWeb, perform: handleUserActivity)
            #else
            if UserDefaults.standard.value(forKey: "isLogged") as? Bool ?? true {
                HomeView()
            } else {
                OnboardView()
            }
            #endif
        }
    }
}

struct TuneslyApp_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
