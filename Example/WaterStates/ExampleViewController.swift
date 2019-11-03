//
//  ViewController.swift
//  WaterStates
//
//  Created by BarredEwe on 10/25/2019.
//  Copyright (c) 2019 BarredEwe. All rights reserved.
//

import UIKit
import WaterStates

protocol ExampleViewInput: class {
    func showState(_ state: DefaultState)
}

protocol ExampleViewOutput: ErrorStateDelegate, EmptyStateDelegate {
    func viewIsReady()
}

class ExamplePresenter: ExampleViewOutput {

    weak var view: ExampleViewInput?

    func viewIsReady() {
        view?.showState(.loading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.view?.showState(.error)
        }
    }

    // MARK: ErrorStateDelegate
    func errorActionTapped(with type: StateActionType) {
        view?.showState(.loading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.view?.showState(.empty)
        }
    }

    // MARK: EmptyStateDelegate
    func emptyActionTapped(with type: StateActionType) {
        view?.showState(.loading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.view?.showState(.error)
        }
    }
}

class ExampleViewController: UIViewController, ExampleViewInput, WaterStates {

    var output: ExampleViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        let presenter = ExamplePresenter()
        presenter.view = self
        output = presenter

        output.viewIsReady()
    }
}
