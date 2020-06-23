//
//  TuneslyApp.swift
//  Tunesly
//
//  Created by Vinicius Mangueira on 22/06/20.
//

import SwiftUI

@main
struct TuneslyApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.value(forKey: "isLogged") as? Bool ?? true {
                HomeView()
            } else {
                OnboardView()
            }
        }
    }
}

struct TuneslyApp_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
