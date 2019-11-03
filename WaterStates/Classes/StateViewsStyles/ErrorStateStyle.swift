//
//  StateView.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public struct ErrorStateStyle {

    var image: UIImage?
    var title: String?
    var description: String?

    static let `default` = ErrorStateStyle(image: UIImage(named: "errorIllustration",
                                                          in: Bundle(for: ErrorView.self),
                                                          compatibleWith: nil),
                                           title: "Error",
                                           description: "Something went wrong.\nPlease try again.")
}
