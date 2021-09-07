//
//  WebLinkViewController.swift
//  Zalak_DRCDemo
//
//  Created by Zalak on 07/09/21.
//  Copyright © 2021 Zalak. All rights reserved.
//

import UIKit
import WebKit

class WebLinkViewController: UIViewController {
    
    // MARK: - Variables
    var url: URL?
    
    private let activityView = UIActivityIndicatorView(style: .large)
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let leftBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissViewController(_:)))
        navigationItem.leftBarButtonItem = leftBtn
        self.title = "News WebSite"
        prepareView()
    }
    
    @objc private func dismissViewController(_ sender : UIButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Prepare View
    private func prepareView() {
        let webView = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height))
        view.addSubview(webView)
        showActivityIndicator()
        if let uri = url {
            webView.load(URLRequest(url: uri))
            webView.uiDelegate = self
            webView.navigationDelegate = self
        }
    }
    
    // MARK: - Helper Methods
    private func showActivityIndicator() {
        activityView.center = view.center
        view.addSubview(activityView)
        activityView.startAnimating()
    }
}

// MARK: - WebView Delegate Methods
extension WebLinkViewController: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping ((WKNavigationActionPolicy) -> Void)) {
       
            decisionHandler(.allow)
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if(activityView.isAnimating) {
            activityView.stopAnimating()
        }
    }
}
