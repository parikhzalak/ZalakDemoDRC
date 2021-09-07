//
//  ImageViewController.swift
//  Zalak_DRCDemo
//
//  Created by Zalak on 07/09/21.
//  Copyright © 2021 Zalak. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
   
    //MARK:- IBOutlet -
    @IBOutlet private weak var imageScrollView  : UIScrollView!
    @IBOutlet private weak var newsImageView    : UIImageView!
    
    //MARK:- Variables -
    var image = UIImage()
    
    //MARK:- LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    private func prepareView() {
        imageScrollView.minimumZoomScale = 1.0
        imageScrollView.maximumZoomScale = 5.0
        imageScrollView.contentSize = .init(width: 2000, height: 2000)
    }
    
}
