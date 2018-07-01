//
//  ArticleTableViewCell.swift
//  NYTimesPopularArticles
//
//  Created by admin on 6/28/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Alamofire

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleHeadingLabel: UILabel!
    
    @IBOutlet weak var articleAuthorLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    
    @IBOutlet weak var articleThumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // For making rounded corners of imageView
        self.articleThumbnailImageView.layer.cornerRadius = self.articleThumbnailImageView.frame.size.width / 2;
        self.articleThumbnailImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
//Extension of UIImageView to download image from URL

extension UIImageView {
    func downloadImageFromUrl(link:String,contentMode: UIViewContentMode) {
        URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data {
                    self.image = UIImage(data: data) }
            }
        }).resume()
    }
}
