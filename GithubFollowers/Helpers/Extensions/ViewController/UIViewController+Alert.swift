//
//  UIViewController+Alert.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-02.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

extension UIViewController {

    func presentSRAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = SRAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
    }

}
