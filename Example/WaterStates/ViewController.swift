//
//  ViewController.swift
//  WaterStates
//
//  Created by BarredEwe on 10/25/2019.
//  Copyright (c) 2019 BarredEwe. All rights reserved.
//

import UIKit
import WaterStates

protocol ViewControllerInput: class {
    func showState(_ state: State<String>)
}

protocol ViewControllerOutput: ErrorStateDelegate {
    func viewIsReady()
}

class Presenter: ViewControllerOutput {

    weak var view: ViewControllerInput?

    func viewIsReady() {
        view?.showState(.loading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.view?.showState(.error(NSError()))
        }
    }

    // MARK: ErrorStateDelegate
    func errorActionTapped(with type: StateActionType) {
        view?.showState(.loading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.view?.showState(.empty)
        }
    }
}

class ViewController: UIViewController, ViewControllerInput, WaterStates {

    var output = Presenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        output.view = self
        output.viewIsReady()
    }

    func showContent(_ contnet: String) {

    }
}
