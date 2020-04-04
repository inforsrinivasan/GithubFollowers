//
//  SRDataLoadingVC.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-02.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SRDataLoadingVC: UIViewController {

    var containerView: UIView?

    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        guard let containerView = containerView else {
            return
        }
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0

        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)

        activityIndicator.centerInSuperview()
        activityIndicator.startAnimating()
    }

    func hideLoadingView() {
        DispatchQueue.main.async {
            self.containerView?.removeFromSuperview()
            self.containerView = nil
        }
    }

}
