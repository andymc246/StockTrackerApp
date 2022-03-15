//
//  NewsCatalogLayout.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/22/22.
//


//this class links the cover image portion of the news articles with the actual article itself and allows a user to open them on safari

import SwiftUI
import BetterSafariView //Added a package dependency “BetterSafariView” from a Github repository url to open news article on safari

struct NewsCatalogLayout: View {
    
    //observed object is a property wrapper that manage external objects
    @ObservedObject var news_Manager: NewsDataManager //connected the news API url along with any error exception
    
    //state is a property wrapper where user can change values inside a struct
    @State private var openSafari = false //show news article on safari if selecte
    @State private var chosenNewsArticle: News? //determine the selected article to direct the change of that article's url
    
    
    var body: some View {
        
        //Vertical Layout Action
        VStack {
            ScrollView (.vertical, showsIndicators: false) { //making a verticle scroll through the news articles
                ForEach (news_Manager.news_Articles) { article in
                    VStack(alignment: .leading) {
                        HStack (alignment: .top) {
                            Text (article.title)
                                .bold()
                                .foregroundColor(.white.opacity(0.8))
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Spacer()
                            
                            //obtain the image of the article
                            ImageMainClass.init(url: URL(string: article.imageURL)!) {
                                RoundedRectangle (cornerRadius: 8)
                                    .fill(Color.white.opacity(0.4))
                            }
                        
                            //applying the image for the news layout section
                            image: {  (img) -> Image in
                                Image (uiImage: img)
                                    .resizable()
                            
                            }
                            
                            .scaledToFill()
                            .frame (width: 100, height: 170)
                            .cornerRadius(8)
                            
                            
                        }
                        .contentShape(Rectangle()) //makes the view of the articles compatiable with the entire news section layout
                        
                        //allow the chosen article to open up on safari
                        .onTapGesture {
                            chosenNewsArticle = article
                            openSafari.toggle()
                        }
                        .sheet(isPresented: $openSafari, content: {
                            getNews(for: chosenNewsArticle ?? article) //either get the chosen news article from user or take the default article
                        })
                        RoundedRectangle (cornerRadius: 12).fill(Color.white.opacity(0.4))
                            .padding (.horizontal, 50)
                            .frame (height: 1)
                    }
                    
                    
                } //end ForEach
            } //end scrollView
            
            
            
        }
    }
    
    //gets the news selected and load it on safari
    private func getNews (for article: News) -> some View {
        //this safari view class comes from the package dependency “BetterSafariView” I imported above
        return SafariView (url: URL(string: article.url.replacingOccurrences(of: "http://", with: "https://"))!) //checks that the url is in correct format
    }
    
    
    
    
    
}
