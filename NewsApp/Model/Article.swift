//
//  Article.swift
//  NewsApp
//
//  Created by Артем Лодыгин on 20.03.2022.
//
//a91c843384cd49bf944825b7fd10c604
//https://newsapi.org/v2/everything?q=apple&from=2022-03-19&to=2022-03-19&sortBy=popularity&apiKey=a91c843384cd49bf944825b7fd10c604

import Foundation


struct Article {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var sourceName: String
    
    init(dictionary: Dictionary<String, Any>){
         author = dictionary["author"] as? String ?? ""
         title = dictionary["title"] as? String ?? ""
         description = dictionary["description"] as? String ?? ""
         url = dictionary["url"] as? String ?? ""
         urlToImage = dictionary["urlToImage"] as? String ?? ""
         publishedAt = dictionary["publishedAt"] as? String ?? ""
         sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["": ""])["name"] as? String ?? ""
        
         
    }
    
}
