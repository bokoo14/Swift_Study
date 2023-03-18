//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Bokyung on 2023/03/18.
//

import Foundation

class NeworkManager: ObservableObject {
     
    // can notice when value(posts) is changed
    @Published var posts = [Post]()
    
    // fetch data from url
    func fetchData() {
        // if URL exists
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil { // if error not exists decode the JSON data
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData) //decode the data
                            DispatchQueue.main.async { // when use Publish, must use main thread
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
