//
//  StateView.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

// MARK: StateViewStyle
public struct LoadingStateStyle {
    var activityIndicator: UIView?
    var title: String?
    var description: String?
    var buttons: [UIButton]

    static let `default` = LoadingStateStyle(activityIndicator: UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge),
                                             description: "Loading..", buttons: [])
}
