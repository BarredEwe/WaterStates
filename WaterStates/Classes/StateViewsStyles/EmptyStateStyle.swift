//
//  StateView.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

// MARK: StateViewStyle
public struct EmptyStateStyle {
    var image: UIImage?
    var title: String?
    var description: String?
    var buttons: [UIButton]

    static let `default` = EmptyStateStyle(image: UIImage(named: "emptyIllustration"),
                                           title: "Nothing to See Here!",
                                           description: "How about we start by adding a package?",
                                           buttons: [])
}
