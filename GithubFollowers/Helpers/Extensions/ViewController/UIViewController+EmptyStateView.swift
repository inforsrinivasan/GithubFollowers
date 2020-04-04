//
//  UIViewController+EmptyStateView.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-03.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

extension UIViewController {

    func showEmptyStateView(withMessage message: String, in view: UIView) {
            let emptyStateView = SREmptyStateView(message: message, frame: view.bounds)

            if view.subviews.contains(emptyStateView) {
                view.bringSubviewToFront(emptyStateView)
            } else {
                view.addSubview(emptyStateView)
            }
    }

    func removeEmptyStateView(in view: UIView) {
        view.subviews.forEach { subView in
            if subView is SREmptyStateView {
                subView.removeFromSuperview()
            }
        }
    }

}

