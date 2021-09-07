//
//  NewsTableViewCell.swift
//  Zalak_DRCDemo
//
//  Created by Zalak on 07/09/21.
//  Copyright © 2021 Zalak. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    //MARK:- IBOutlet -
    @IBOutlet private weak var profileImageview     : UIImageView!
    @IBOutlet private weak var newsTitleLabel       : UILabel!
    @IBOutlet private weak var newsWebLinkButton    : UIButton!
    @IBOutlet private weak var authorNameLabel      : UILabel!
    @IBOutlet private weak var dateLabel            : UILabel!
    
    //MARK:- Variables -
    
    //MARK: - Callback
    var didTapOnWebLink: (() -> ())?
    
    //MARK:- Cell Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

//MARK: - Set Data -
extension NewsTableViewCell {
    
    func setDataWith(_ data: ArticleModel) {
        newsTitleLabel.text = data.title
        newsWebLinkButton.setTitle(data.webLink, for: .normal)
        newsWebLinkButton.underline()
        authorNameLabel.text = data.author
        dateLabel.text = Utility.getDate(data.publishedAt ?? "").lowercased()
        setImageWith(data.urlToImage ?? "")
    }
    
    func setImageWith(_ url: String) {
           if let url = URL(string: url) {
               let task = URLSession.shared.dataTask(with: url) { data, response, error in
                   guard let data = data, error == nil else { return }
                   
                   DispatchQueue.main.async { /// execute on main thread
                       self.profileImageview.image = UIImage(data: data)
                   }
               }
               
               task.resume()
           }
       }
}

//MARK: - UIButton Action
extension NewsTableViewCell {
    
    @IBAction private func didTapOnWebLink(_ sender: UIButton) {
        didTapOnWebLink?()
    }
}

