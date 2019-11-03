//
//  StateView.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public struct EmptyStateStyle {

    var image: UIImage?
    var title: String?
    var description: String?

    static let `default` = EmptyStateStyle(image: UIImage(named: "emptyIllustration",
                                                          in: Bundle(for: EmptyView.self),
                                                          compatibleWith: nil),
                                           title: "Nothing to See Here!",
                                           description: "This screen is empty.\nTo see something new, please update later.")
}
