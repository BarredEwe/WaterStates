//
//  WaterStatesConfig.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 01.11.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

public struct WaterStatesConfig {
    public static var errorView: ErrorStateView = ErrorView.loadFromNib()
    public static var loadingView: LoadingStateView = LoadingView.loadFromNib()
    public static var emptyView: EmptyStateView = EmptyView.loadFromNib()

    public static var errorStyle: ErrorStateStyle = .default
    public static var loadingStyle: LoadingStateStyle = .default
    public static var emptyStyle: EmptyStateStyle = .default

    public static var loadingDefaultDelay: TimeInterval = 0.1
    public static var loadingDefaultMinPresentationTime: TimeInterval = 0.2
}
