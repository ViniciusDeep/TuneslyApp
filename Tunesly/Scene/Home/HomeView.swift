//
//  ContentView.swift
//  Tunesly
//
//  Created by Vinicius Mangueira on 22/06/20.
//

import SwiftUI
import SDWebImageSwiftUI
import WPImageKit

struct HomeView: View {
    
    @ObservedObject var service = AppStoreService()
    
    var body: some View {
       NavigationView {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))],spacing: 20) {
                ForEach(service.appStore.feed.results) { result in
                    VStack {
                        WebImage(url: URL(string: result.artworkUrl100))
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(8)
                        Text(result.name)
                            .font(.caption)
                    }
                }
           }.padding()
        }.navigationBarTitle("Library", displayMode: .automatic)
      }
   }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
