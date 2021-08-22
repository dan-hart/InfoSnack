//
//  ContentView.swift
//  Shared
//
//  Created by Dan Hart on 5/19/21.
//

import SwiftUI

struct ContentView: View {    
    @State var snacks: [Article]?

    var body: some View {
        NavigationView {
            if let snacks = snacks {
                List {
                    ForEach(snacks, id: \.self) { article in
                        NavigationLink(
                            destination: ArticleView(article: article),
                            label: {
                                Text(article.title ?? "No Title")
                                    .font(.title2)
                            })
                    }
                }
                
                .navigationTitle("Articles")
            } else {
                Text("Loading...")
                    .font(.title)
            }
        }
        .onAppear {
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
        ContentView(snacks: [])
    }
}
