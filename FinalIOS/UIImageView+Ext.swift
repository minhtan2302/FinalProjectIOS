//
//  UIImageView+Ext.swift
//  FinalIOS
//
//  Created by Tân Phù on 03/08/2022.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(from urlString: String?, completion: ((UIImage?) -> Void)?) {
        
        guard let urlString = urlString,
            let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                }
                completion?(image)
            } else {
                completion?(nil)
            }
        }.resume()
    }
}
