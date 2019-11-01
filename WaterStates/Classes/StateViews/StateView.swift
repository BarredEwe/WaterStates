//
//  StateView.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public protocol StateView: UIView, DisplaybleView { }

typealias ListModel = [String]

enum ContentType<T> {
    case table(ListModel)
    case custom(T)
}
