//
//  ErrorStateView.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

public protocol ErrorStateView: StateView {
    var delegate: ErrorStateDelegate? { get set }
    func configure(with error: Error?)
}

public protocol ErrorStateDelegate: class {
    func errorActionTapped(with type: StateActionType)
}
