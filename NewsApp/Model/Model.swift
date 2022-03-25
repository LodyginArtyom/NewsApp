//
//  Model.swift
//  NewsApp
//
//  Created by Артем Лодыгин on 20.03.2022.
//

import Foundation

var articles: [Article] {
    let data = try? Data(contentsOf: urlToData)
    if data == nil{
        return []
    }
     
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return []
    }
    
    let rootDictionary = rootDictionaryAny as?   Dictionary<String, Any>
    if rootDictionary == nil {
        return []
    }
    
    if let array = rootDictionary!["articles"] as?  [Dictionary<String, Any>]{
        var returnArray : [Article] = []
        for dict in array {
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
            
        }
        
        return returnArray
    }
    
    return []
}

var urlToData :  URL{
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}

func loadNews(complitionHandler : (()->Void)?){
    
    let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-03-19&to=2022-03-19&sortBy=popularity&apiKey=a91c843384cd49bf944825b7fd10c604")
    let session = URLSession(configuration: .default)
    
    let downloadTask = session.downloadTask(with: url!) { urlFile, responce, error in
        if urlFile != nil {
            
            
            
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            
            complitionHandler?()
            
           
//            print(urlPath  )
        }
    }.resume()
}


