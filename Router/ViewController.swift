//
//  ViewController.swift
//  Router
//
//  Created by Jinsei Shima on 2018/09/07.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

struct Path<T: UIViewController> {
    let destination: T
    init(destination: T) {
        self.destination = destination
    }
}

protocol Pathable {

}


class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

        _ = toVC2().destination.toVC3()

    }
}

extension ViewController1: Pathable {
    func toVC2() -> Path<ViewController2> {
        let controller = ViewController2()
        navigationController?.pushViewController(controller, animated: false)
        return Path(destination: controller)
    }
}


class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }
}

extension ViewController2: Pathable {
    func toVC3() -> Path<ViewController3>{
        let controller = ViewController3()
        navigationController?.pushViewController(controller, animated: false)
        return Path(destination: controller)
    }
}

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }
}


