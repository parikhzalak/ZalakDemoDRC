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
        authorNameLabel.text = data.author
        dateLabel.text = data.publishedAt
    }
}

//MARK: - UIButton Action
extension NewsTableViewCell {
    
    @IBAction private func didTapOnWebLink(_ sender: UIButton) {
        didTapOnWebLink?()
    }
}

