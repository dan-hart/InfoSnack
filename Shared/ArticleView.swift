//
//  ArticleView.swift
//  InfoSnack
//
//  Created by Dan Hart on 8/21/21.
//

import SwiftUI

struct ArticleView: View {
    @State var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title ?? "")
                .font(.largeTitle)
            Text(article.author ?? "")
                .font(.title2)
            Text(article.source ?? "")
                .font(.subheadline)
            Spacer()
            Text(article.articleDescription ?? "")
            Spacer()
        }
        .padding()
        
            .navigationTitle(article.title ?? "")
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article(author: "Steve Jobs", url: "https://www.apple.com", source: "New York Times", title: "The Crazy Ones", articleDescription: "Here's to the crazy ones, the misfits, the rebels, the troublemakers, the round pegs in the square holes... the ones who see things differently - they're not fond of rules... You can quote them, disagree with them, glorify or vilify them, but the only thing you can't do is ignore them because they change things... they push the human race forward, and while some may see them as the crazy ones, we see genius, because the ones who are crazy enough to think that they can change the world, are the ones who do.", image: "", date: Date()))
    }
}
