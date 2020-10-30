//
//  SecondViewController.swift
//  WaterStates_Example
//
//  Created by Максим Гришутин on 21.04.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import WaterStates

class SecondViewController: UIViewController, WaterStates {
    override func viewDidLoad() {
        super.viewDidLoad()
        showState(.loading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showState(.error)
        }
    }
}
