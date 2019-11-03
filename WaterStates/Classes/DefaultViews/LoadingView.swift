//
//  LoadingView.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 31.10.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class LoadingView: UIView, NibLoadable, LoadingStateView {

    @IBOutlet weak var activityIndicator: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionInfo: UILabel!

    public func configure() {
        activityIndicator = WaterStatesConfig.loadingStyle.activityIndicator
        descriptionInfo.text = WaterStatesConfig.loadingStyle.description
        title.text = WaterStatesConfig.loadingStyle.title
    }
}
