//
//  Extension.swift
//  AlexApps Demo
//
//  Created by Ali Mohamed on 8/13/20.
//  Copyright © 2020 Ali Mohamed. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(FromURL urlSting: String ,placeholder: String) {
        if let url = URL(string: urlSting) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error  {
                    print("error while fetching image", error.localizedDescription)
                    self.image = UIImage(named: placeholder)
                    return
                }
                DispatchQueue.main.async {[weak self] in
                    if let data = data {
                        let image = UIImage(data: data)
                        self?.image = image
                    }
                }
            }.resume()
        } else {
            self.image = UIImage(named: placeholder)
        }
    }
}
