//
//  EmptyView.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class EmptyView: UIView, NibLoadable, EmptyStateView {

    weak public var delegate: EmptyStateDelegate?

    @IBOutlet weak var emptyImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionInfo: UILabel!
    @IBOutlet weak var retryButton: UIButton!

    public func configure(with message: String?) {
        descriptionInfo.text = message ?? WaterStatesConfig.emptyStyle.description
        title.text = WaterStatesConfig.emptyStyle.title
        emptyImageView.image = WaterStatesConfig.emptyStyle.image
        retryButton.isHidden = delegate == nil
    }

    @IBAction func retryButtonTapped(_ sender: UIButton) {
        delegate?.emptyActionTapped(with: .retry)
    }
}
