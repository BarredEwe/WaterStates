//
//  StateView.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public struct LoadingStateStyle {

    var activityIndicator: UIView?
    var title: String?
    var description: String?

    static let `default` = LoadingStateStyle(activityIndicator: UIActivityIndicatorView(style: .whiteLarge),
                                             title: "Loading...")
}
