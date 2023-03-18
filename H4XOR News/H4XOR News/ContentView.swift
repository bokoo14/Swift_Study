//
//  ContentView.swift
//  H4XOR News
//
//  Created by Bokyung on 2023/03/17.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NeworkManager()
    
    var body: some View {
        NavigationView {
            List (networkManager.posts){ post in
                Text(post.title)
            } .navigationTitle("H4XOR NEWS")
        }
        .onAppear { // when view appear
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
