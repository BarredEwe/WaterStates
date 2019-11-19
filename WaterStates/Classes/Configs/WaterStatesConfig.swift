//
//  WaterStatesConfig.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

/// The main configuration of the WaterStates
public class WaterStatesConfig {

    public static var errorView: WaterStateView = defaultErrorView
    public static var loadingView: WaterStateView = defaultLoadingView
    public static var emptyView: WaterStateView = defaultEmptyView

    public static var loadingDefaultDelay: TimeInterval = 0.1
    public static var loadingDefaultMinPresentationTime: TimeInterval = 0.2
}

extension WaterStatesConfig {
    internal static var defaultErrorView: WaterStateView {
        let stateView = WaterStateView()
        stateView.titleView = UIImageView(image: UIImage(named: "errorIllustration",
                                                         in: Bundle(for: WaterStateView.self),
                                                         compatibleWith: nil))
        stateView.title = "Error"
        stateView.descriptionInfo = "Something went wrong.\nPlease try again."
        stateView.buttonTitle = "Retry"
        return stateView
    }

    internal static var defaultLoadingView: WaterStateView {
        let stateView = WaterStateView()
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        activityIndicator.startAnimating()
        stateView.titleView = activityIndicator
        stateView.title = "Loading..."
        return stateView
    }

    internal static var defaultEmptyView: WaterStateView {
        let stateView = WaterStateView()
        stateView.titleView = UIImageView(image: UIImage(named: "emptyIllustration",
                                                         in: Bundle(for: WaterStateView.self),
                                                         compatibleWith: nil))
        stateView.title = "Nothing to See Here!"
        stateView.descriptionInfo = "This screen is empty.\nTo see something new, please update later."
        stateView.buttonTitle = "Reload"
        return stateView
    }
}
