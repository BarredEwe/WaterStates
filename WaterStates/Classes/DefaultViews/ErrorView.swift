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

    public func configure(with error: Error) {

    }

    @IBAction func retryButtonTapped(_ sender: UIButton) {
        delegate?.errorActionTapped(with: .retry)
    }
}
