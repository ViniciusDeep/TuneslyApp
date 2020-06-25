//
//  ContentView.swift
//  Tunesly
//
//  Created by Vinicius Mangueira on 22/06/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @State var service = AppStoreService()
    
    var body: some View {
       NavigationView {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))],spacing: 20) {
                ForEach(service.appStore.feed.results) { result in
                    VStack {
                        WebImage(url: URL(string: result.name))
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(8)
                        Text(result.name)
                            .font(.caption)
                    }
                }.onAppear {
                    service.loadData(point: .comingSoon(count: 10))
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
