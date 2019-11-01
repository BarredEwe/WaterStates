//
//  StateView.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

// MARK: StateViewStyle
public struct ErrorStateStyle {
    var image: UIImage?
    var title: String?
    var description: String?
    var buttons: [UIButton]

    static let `default` = ErrorStateStyle(image: UIImage(named: "errorIllustration"),
                                           title: "Error",
                                           description: "Something bad happening. Might have to give it another go.",
                                           buttons: [])
}
