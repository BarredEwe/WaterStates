//
//  EmptyStateView.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

public protocol EmptyStateView: StateView {
    var delegate: EmptyStateDelegate? { get set }
    func configure(with message: String?)
}

public protocol EmptyStateDelegate: class {
    func emptyActionTapped(with type: StateActionType)
}
