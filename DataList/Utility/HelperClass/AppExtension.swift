//
//  AppExtension.swift
//  DataList
//
//  Created by Rishil Patel on 12/01/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    func gettopMostViewController() -> UIViewController? {
        return self.keyWindow?.rootViewController?.findtopViewController()
    }
}
extension UIViewController {
    
    class var storyboardID : String {
        return "\(self)"
    }
    
    
    func findtopViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return findtopViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return findtopViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return findtopViewController(controller: presented)
        }
        return controller
    }
    
    func presentAlerterror(title:String,message:String, okclick:(()->())?) {
        let AlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            if okclick != nil {
                okclick!()
            }
        }
        AlertController.addAction(okAction)
        self.present(AlertController, animated: true) {
            
        }
    }
}
extension UIImageView {
    func dowloadFromServer(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func dowloadFromServer(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        dowloadFromServer(url: url, contentMode: mode)
    }
}
