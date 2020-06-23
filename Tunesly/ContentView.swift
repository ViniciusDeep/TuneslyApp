//
//  ContentView.swift
//  Tunesly
//
//  Created by Vinicius Mangueira on 22/06/20.
//

import SwiftUI


struct Person: Identifiable {
    var id: Int = UUID().hashValue
    let name: String
    let age: Int8
}

struct ContentView: View {
    
    @State() var persons = [Person(name: "David Jackson", age: 18), Person(name: "Michael", age: 10)]
    
    var body: some View {
        List(persons) { item in
            Text(item.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
