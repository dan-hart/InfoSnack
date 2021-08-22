//
//  ArticleRowView.swift
//  InfoSnack
//
//  Created by Dan Hart on 8/21/21.
//

import SwiftUI

struct ArticleRowView: View {
    @State var article: Article
    
    var body: some View {
        HStack {
            if #available(iOS 15.0, *), #available(macOS 12.0, *) {
                AsyncImage(url: URL(string: article.image ?? "") ?? URL(fileURLWithPath: "")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .frame(width: 100, height: 100)
                        
                    case .failure:
                        Rectangle()
                            .foregroundColor(Color.init(white: 0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .frame(width: 100, height: 100)
                        
                    case .empty:
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color.init(white: 0.8))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .frame(width: 100, height: 100)
                            
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        }
                        
                    @unknown default:
                        Rectangle()
                            .foregroundColor(Color.init(white: 0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .frame(width: 100, height: 100)
                    }
                }
            }
            Text(article.title ?? "")
        }
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(article: Article.steveJobsMockArticle)
    }
}
