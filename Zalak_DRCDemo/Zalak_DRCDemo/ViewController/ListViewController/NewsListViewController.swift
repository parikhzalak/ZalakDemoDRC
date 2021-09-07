//
//  NewsListViewController.swift
//  Zalak_DRCDemo
//
//  Created by Zalak on 07/09/21.
//  Copyright © 2021 Zalak. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {
    
    //MARK:- IBOutlet -
    @IBOutlet private weak var newsListTableView    : UITableView!
    @IBOutlet private weak var indicatiorView       : UIActivityIndicatorView!
    
    //MARK:- Variables -
    var articlesData   = [ArticleModel]()
    
    //MARK:- LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatiorView.isHidden = false
        indicatiorView.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNewsList { (data) in
            self.articlesData = data
            DispatchQueue.main.async {
                self.indicatiorView.isHidden = true
                self.newsListTableView.reloadData()
            }
        }
    }
}

//MARK:- UITableViewDataSource -
extension NewsListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.setDataWith(articlesData[indexPath.row])
        cell.didTapOnWebLink = {
            //Open WKWebView Screen
            self.presentWKWebScreenWith(self.articlesData[indexPath.row].webLink ?? "")
        }
        return cell
    }
}

//MARK:- UITableViewDelegate -
extension NewsListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToNewsDetailScreenWith(articlesData[indexPath.row])
    }
}

//MARK: - Navigation -
private extension NewsListViewController {
    
    private func moveToNewsDetailScreenWith(_ data: ArticleModel) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let newsDetailVC = storyBoard.instantiateViewController(withIdentifier: "NewsDetailViewController") as! NewsDetailViewController
        newsDetailVC.articalDetail = data
        navigationController?.pushViewController(newsDetailVC, animated: true)
    }
    
    private func presentWKWebScreenWith(_ link: String) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let wkWebVC = storyBoard.instantiateViewController(withIdentifier: "WebLinkViewController") as! WebLinkViewController
    
        let navigationController = Utility.createNavigation(for: wkWebVC)
        wkWebVC.url = URL( string: link)
        present(navigationController, animated: true, completion: nil)
    }
    
}

//MARK: - APi Call -
private extension NewsListViewController {
    private func getNewsList(completion: @escaping (([ArticleModel]) -> Void)) {
        
        let APIKEY = "b26491b7315d40e68583610914cb8a34"
        let APIString =  "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=\(APIKEY)"
        print("api : \(APIString)")
        
        var request = URLRequest(url: URL(string: APIString)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(NewsResultModel.self, from: data!)
                
                print(responseModel)
                
                if let articalData = responseModel.articles, !articalData.isEmpty {
                    completion(articalData)
                }
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
}
