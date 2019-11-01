//
//  ErrorView.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 31.10.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class ErrorView: UIView, NibLoadable, ErrorStateView {

    weak public var delegate: ErrorStateDelegate?

    @IBOutlet weak var errorImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionInfo: UILabel!

    public func configure(with error: Error?) {
        descriptionInfo.text = error?.localizedDescription ?? WaterStatesConfig.errorStyle.description
        title.text = WaterStatesConfig.errorStyle.title
        errorImageView.image = WaterStatesConfig.errorStyle.image
    }

    @IBAction func retryButtonTapped(_ sender: UIButton) {
        delegate?.errorActionTapped(with: .retry)
    }
}
