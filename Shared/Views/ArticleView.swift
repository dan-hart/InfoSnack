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
            if #available(iOS 15.0, *), #available(macOS 12.0, *)  {
                AsyncImage(url: URL(string: article.image ?? "") ?? URL(fileURLWithPath: "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                } placeholder: {
                    Rectangle()
                        .foregroundColor(Color.init(white: 0.8))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
            VStack(alignment: .leading) {
                Text(article.source ?? "")
                    .font(.title)
                Text(article.author ?? "")
                    .font(.subheadline)
            }
            .padding(.bottom)
            
            Text(article.title ?? "")
                .bold()
                .padding(.bottom)
            Text(article.articleDescription ?? "")
                .italic()
                .padding(.bottom)
            Link("Read on \(article.source ?? "")", destination: URL(string: article.url ?? "") ?? URL(fileURLWithPath: ""))
            Spacer()
        }
        .padding()
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.steveJobsMockArticle)
    }
}
