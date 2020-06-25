//
//  Service.swift
//  Tunesly
//
//  Created by Vinicius Mangueira on 22/06/20.
//

import Combine
import SwiftUI

class AppStoreService: ObservableObject {
    
    var didChange = PassthroughSubject<AppStoreService, Error>()
    
    @Published var appStore = AppStore() {
        didSet {
            didChange.send(self)
        }
    }
    
    func loadData(point: PointRouter) {
        guard let url = point.pointedURL else {return}
                
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
             if let error = error {
                self.didChange.send(completion: Subscribers.Completion<Error>.failure(error))
            }
            do {
                let appStore = try JSONDecoder().decode(AppStore.self, from: data)
                DispatchQueue.main.async {
                    self.appStore = appStore
                }
            } catch let error {
                self.didChange.send(completion: Subscribers.Completion<Error>.failure(error))
            }
        }.resume()
    }
}

enum PointRouter {
    case comingSoon(count: Int)
    
    var baseUrl: String {"https://rss.itunes.apple.com/api/v1/us/apple-music/"}
    
    var pointedURL: URL? {
        switch self {
        case .comingSoon(let count):
            return URL(string: baseUrl + "coming-soon/all/\(count)/explicit.json")
        }
    }
}


