//
//  ViewController.swift
//  WaterStates
//
//  Created by BarredEwe on 10/25/2019.
//  Copyright (c) 2019 BarredEwe. All rights reserved.
//

import UIKit
import WaterStates

class FirstViewController: UIViewController, WaterStates {
    var errorView: WaterStateView? {
        let stateView = WaterStateView()
        stateView.titleView = UIImageView(image: UIImage(named: "errorIllustration",
                                                         in: Bundle(for: WaterStateView.self),
                                                         compatibleWith: nil))
        stateView.title = "Example ERROR"
        stateView.descriptionInfo = "Something went wrong.\nPlease try again."
        stateView.buttonTitle = "Retry?"
        return stateView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showState(.loading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showState(.error)
        }
    }
}

extension FirstViewController: WaterStatesDelegate {
    func errorActionTapped(with _: StateActionType) {
        showState(.loading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showState(.empty)
        }
    }

    func emptyActionTapped(with _: StateActionType) {
        showState(.loading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showState(.error)
        }
    }
}
