//
//  Service.swift
//  Tunesly
//
//  Created by Vinicius Mangueira on 22/06/20.
//

import Combine
import SwiftUI

class Service<T: Decodable> {
    
    var didChange = PassthroughSubject<Service, Error>()
    
    var element: T? {
        didSet {
            didChange.send(self)
        }
    }
    
    func get(point: PointRouter) {
        guard let url = point.pointedURL else {return}
                
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
             if let error = error {
                self.didChange.send(completion: Subscribers.Completion<Error>.failure(error))
            }
            do {
                let element = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    self.element = element
                }
            } catch let error {
                self.didChange.send(completion: Subscribers.Completion<Error>.failure(error))
            }
        }.resume()
    }
}

enum PointRouter {
    case artist
    case music
    case genre
    
    var baseUrl: String {""}
    
    var pointedURL: URL? {
        switch self {
        case .artist:
            return URL(string: baseUrl + "")
        case .genre:
            return URL(string: baseUrl + "")
        case .music:
            return URL(string: baseUrl + "")
        }
    }
}


