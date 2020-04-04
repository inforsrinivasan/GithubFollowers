//
//  SRAlertViewController.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-02.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SRAlertViewController: UIViewController {

    var alertTitle: String?
    var alertMessage: String?
    var buttonTitle: String?

    let containerView = SLAlertContainer()
    let alertTitleLabel = SRTitleLabel(textAlignment: .center, fontSize: 22)
    let alertMessageLabel = SRBodyLabel(textAlignment: .center)
    let button = SRButton(withColor: .purple, withTitle: "OK")


    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.alertMessage = message
        self.buttonTitle = buttonTitle
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.80)
        addSubViews()
        configureContainerView()
        configureAlertTitle()
        configureAlertMessage()
        configureButton()
    }

    private func configureContainerView() {
        containerView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .zero, size: .init(width: 280, height: 220))
        containerView.centerInSuperview()
    }

    private func addSubViews() {
        view.addSubview(containerView)
        containerView.addSubview(alertTitleLabel)
        containerView.addSubview(alertMessageLabel)
        containerView.addSubview(button)
    }

    private func configureAlertTitle() {
        alertTitleLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 28))
        alertTitleLabel.text = alertTitle
    }

    private func configureAlertMessage() {
        alertMessageLabel.anchor(top: alertTitleLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: button.topAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 20), size: .zero)
        alertMessageLabel.numberOfLines = 4
        alertMessageLabel.text = alertMessage
    }

    private func configureButton() {
        button.addTarget(self, action: #selector(okButtonPressed), for: .touchUpInside)
        button.titleLabel?.text = buttonTitle
        button.anchor(top: nil, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 20, right: 20), size: .init(width: 0, height: 44))
    }

    // MARK: IBAction

    @objc
    func okButtonPressed() {
        dismiss(animated: true, completion: nil)
    }

}
