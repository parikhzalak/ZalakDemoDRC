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
    var employeeData = [String]()
    
    //MARK:- LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatiorView.isHidden = false
        indicatiorView.startAnimating()
    }
}

//MARK:- UITableViewDataSource -
extension NewsListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//employeeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.setDataWith()
        cell.didTapOnWebLink = {
            //Open WKWebView Screen
        }
        return cell
    }
}

//MARK:- UITableViewDelegate -
extension NewsListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        moveToNewsDetailScreenWith()
    }
}

//MARK: - Navigation -
private extension NewsListViewController {
    
    private func moveToNewsDetailScreenWith() { //_ data: EmployeeModel
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let newsDetailVC = storyBoard.instantiateViewController(withIdentifier: "NewsDetailViewController") as! NewsDetailViewController
        navigationController?.pushViewController(newsDetailVC, animated: true)
    }
    
    private func presentWKWebScreenWith(_ link: String) { //_ data: EmployeeModel
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let wkWebVC = storyBoard.instantiateViewController(withIdentifier: "WebLinkViewController") as! WebLinkViewController
        wkWebVC.webLink = link
        navigationController?.pushViewController(wkWebVC, animated: true)
    }
    
}

//MARK: - APi Call -
private extension NewsListViewController {
    private func getNewsList(completion: @escaping (() -> Void)) {
        let API =  "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=API_KEY"
        var request = URLRequest(url: URL(string: API)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
//                let jsonDecoder = JSONDecoder()
                //                let responseModel = try jsonDecoder.decode(EmployeeListModel.self, from: data!)
                ////                print(responseModel)
                //                if let employeeData = responseModel.data , !employeeData.isEmpty {
                //                    completion(employeeData)
                //                }
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
}
