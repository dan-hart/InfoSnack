//
//  ContentView.swift
//  Shared
//
//  Created by Dan Hart on 5/19/21.
//

import SwiftUI

struct ContentView: View {    
    @State var snacks: [Article] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(snacks, id: \.self) { article in
                    Text(article.title ?? "No Title")
                }
            }
            
            .navigationTitle("Snacks")
        }.onAppear {
            guard let url = URL(string: "https://api.lil.software/news") else { return }
            let task = URLSession.shared.infoResponseTask(with: url) { infoResponse, response, error in
                if let infoResponse = infoResponse {
                    self.snacks = infoResponse.articles ?? []
                }
            }
            task.resume()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
