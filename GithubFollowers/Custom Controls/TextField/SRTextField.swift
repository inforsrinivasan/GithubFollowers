//
//  SRTextField.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-01.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SRTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(placeholder: String) {
        self.init(frame: .zero)
        setPlaceholder(placeholder: placeholder)
    }

    private func configureTextField() {

        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor

        textColor = .label
        tintColor = .label
        textAlignment = .center

        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12

        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        keyboardType = .default
        returnKeyType = .search
        autocapitalizationType = .none
        clearButtonMode = .whileEditing
    }

    private func setPlaceholder(placeholder: String) {
        self.placeholder = placeholder
    }

}
