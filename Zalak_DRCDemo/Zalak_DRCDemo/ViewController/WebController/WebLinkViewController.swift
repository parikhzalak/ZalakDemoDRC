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
    
    //MARK:- IBOutlet -
    
    //MARK:- Variables -
    private let webView = WKWebView()
    
    var webLink = ""
    
    //MARK:- LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    private func prepareView() {
        webView.frame = view.bounds
        webView.navigationDelegate = self
        
        let url = URL(string: "https://www.google.com")!
        let urlRequest = URLRequest(url: url)
        
        webView.load(urlRequest)
        webView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        view.addSubview(webView)
    }
    
}

//MARK:- WK navigation Delegate -
extension WebLinkViewController : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated  {
            if let url = navigationAction.request.url,
                let host = url.host, !host.hasPrefix("www.google.com"),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
                print(url)
                print("Redirected to browser. No need to open it locally")
                decisionHandler(.cancel)
            } else {
                print("Open it locally")
                decisionHandler(.allow)
            }
        } else {
            print("not a user click")
            decisionHandler(.allow)
        }
    }
}
