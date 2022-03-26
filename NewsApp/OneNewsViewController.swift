//
//  OneNewsViewController.swift
//  NewsApp
//
//  Created by Артем Лодыгин on 23.03.2022.
//

import UIKit
import SafariServices

class OneNewsViewController: UIViewController {
    
    var index : Int = 0
    
    var article : Article!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var openSafariOutlet: UIButton!
    @IBOutlet weak var loadImage: UIActivityIndicatorView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = article.title
        labelDescription.text = article.description
//        imageView = article.urlToImage
        if (URL(string: article.url)) == nil{
            self.openSafariOutlet.isEnabled = false
        }else{
            self.openSafariOutlet.isEnabled = true
        }
        
        DispatchQueue.main.async {
            if self.article.urlToImage == nil{
                self.loadImage.isHidden = true
            }
            if let url = URL(string: self.article.urlToImage){
                if let data = try? Data(contentsOf: url){
                    self.imageView.image = UIImage(data: data)
                }else{
                    self.loadImage.isHidden = true
                }
            }else{
                self.loadImage.isHidden = true
            }
        }
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushOpenAction(_ sender: Any) {
        if let url = URL(string: article.url) {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)

        }
        
    }
    
   
}
