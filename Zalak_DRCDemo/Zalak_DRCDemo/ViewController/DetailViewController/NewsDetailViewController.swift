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
    @IBOutlet private weak var profileImageview     : UIButton!
    @IBOutlet private weak var newsTitleLabel       : UILabel!
    @IBOutlet private weak var authorNameLabel      : UILabel!
    @IBOutlet private weak var newsWebLinkLabel     : UILabel!
    @IBOutlet private weak var dateLabel            : UILabel!
    
    //MARK:- Variables -
    var employeeData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
