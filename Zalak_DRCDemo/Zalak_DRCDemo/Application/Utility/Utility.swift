//
//  Utility.swift
//  Zalak_DRCDemo
//
//  Created by Zalak on 07/09/21.
//  Copyright © 2021 Zalak. All rights reserved.
//

import UIKit

class Utility {
    
    //MARK: - Navigation
    class func createNavigation(for vc: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.navigationBar.isHidden = false
        navigationController.modalTransitionStyle = .coverVertical
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }
    
    class func getDate(_ dateStr: String) -> String{
        
        // create dateFormatter with UTC time format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSX"
        dateFormatter.timeZone = TimeZone.current
        let date = dateFormatter.date(from: dateStr)
        return stringWithLocalTime(fromDate: date ?? Date())
    }
    
    class func stringWithLocalTime(fromDate date:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM, YYYY h:mm a"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        return formatter.string(from: date)
    }
    
}

extension UIButton {
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        //NSAttributedStringKey.foregroundColor : UIColor.blue
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
