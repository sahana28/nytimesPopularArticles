//
//  ArticlesDetailViewController.swift
//  NYTimesPopularArticles
//
//  Created by admin on 6/28/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ArticlesDetailViewController: UIViewController,UIWebViewDelegate {
    var article = Article()
    var activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var articleCaptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addActivityIndicator()
        self.imageView.downloadImageFromUrl(link: article.imageUrl, contentMode: .scaleToFill)
        if let articleCaption = article.caption as String? {
        self.articleCaptionLabel.text = articleCaption
        }
        loadWebView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: Webview delegate method
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.activityIndicator.stopAnimating()
    }
    
    func loadWebView() {
        let url = URL (string: article.url)
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
    }
    func addActivityIndicator() {
        self.activityIndicator = UIActivityIndicatorView.init(activityIndicatorStyle:.gray)
        self.activityIndicator.frame = CGRect(x:self.view.frame.midX,y:self.view.frame.midY,width:30,height:20)
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        self.view .addSubview(self.activityIndicator)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
