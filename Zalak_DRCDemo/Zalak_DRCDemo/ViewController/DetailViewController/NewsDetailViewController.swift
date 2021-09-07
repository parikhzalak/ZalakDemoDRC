//
//  NewsDetailViewController.swift
//  Zalak_DRCDemo
//
//  Created by Zalak on 07/09/21.
//  Copyright © 2021 Zalak. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    //MARK:- IBOutlet -
    
    @IBOutlet private weak var newsTitleLabel       : UILabel!
    @IBOutlet private weak var authorNameLabel      : UILabel!
    @IBOutlet private weak var contentLabel         : UILabel!
    @IBOutlet private weak var profileImageview     : UIButton!
    @IBOutlet private weak var discriptionLabel     : UILabel!
    @IBOutlet private weak var newsWebLinkLabel     : UILabel!
    @IBOutlet private weak var dateLabel            : UILabel!
    
    //MARK:- Variables -
    var articalDetail : ArticleModel!
    
    //MARK:- LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Details"
        setUpData()
    }
    
    private func setUpData() {
        newsTitleLabel.text     = articalDetail.title
        authorNameLabel.text    = articalDetail.author
        contentLabel.text       = articalDetail.content
        discriptionLabel.text   = articalDetail.newsDescription
        newsWebLinkLabel.text   = articalDetail.webLink
        dateLabel.text          = articalDetail.publishedAt
        profileImageview.setImage(UIImage(), for: .normal)
    }
}

//MARK: - UIButton Action
extension NewsDetailViewController {
    
    @IBAction private func didTapOnWebLink(_ sender: UIButton) {
        presentWKWebScreenWith("")
    }
    
    @IBAction private func didTapOnNewsImage(_ sender: UIButton) {
        moveToNewsImageScreenWith(UIImage())
    }
}

//MARK: - Navigation -
private extension NewsDetailViewController {
    
    private func moveToNewsImageScreenWith(_ image: UIImage) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let imgVC = storyBoard.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        navigationController?.pushViewController(imgVC, animated: true)
    }
    
    private func presentWKWebScreenWith(_ link: String) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let wkWebVC = storyBoard.instantiateViewController(withIdentifier: "WebLinkViewController") as! WebLinkViewController
        
        let navigationController = Utility.createNavigation(for: wkWebVC)
        wkWebVC.url = URL( string: link)
        present(navigationController, animated: true, completion: nil)
    }
    
}
