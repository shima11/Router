//
//  ViewController.swift
//  Router
//
//  Created by Jinsei Shima on 2018/09/07.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit


typealias Node = UIViewController & Pathable

struct Path<S: Node, D: Node> {

    let source: S
    let destination: D

    var identifier: String {
        return String(describing: type(of: source)) + "/" + String(describing: type(of: destination))
    }

    var path: Path<S, D> {
        return self
    }

    init(source: S, destination: D) {
        self.source = source
        self.destination = destination
    }

}

protocol Pathable { }


//struct Edge {
//
//    typealias Node = UIViewController
//
//    let source: Node
//    let destination: Node
//
//    var identifier: String {
//        return String(describing: type(of: source)) + "/" + String(describing: type(of: destination))
//    }
//
//    var edge: Edge {
//        return self
//    }
//
//}

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

        let a = toVC2().destination.toVC3()
        print("path identifier:", a.identifier)

    }
}

extension ViewController1 : Pathable {

    func toVC2() -> Path<ViewController1, ViewController2> {
        let controller = ViewController2()
        navigationController?.pushViewController(controller, animated: false)
        return Path(source: self, destination: controller)
    }

//    func toVC2() -> Edge {
//        let controller = ViewController2()
//        navigationController?.pushViewController(controller, animated: false)
//        return Edge(source: self, destination: controller)
//    }
}


class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }
}

extension ViewController2 : Pathable {

    func toVC3() -> Path<ViewController2, ViewController3>{
        let controller = ViewController3()
        navigationController?.pushViewController(controller, animated: false)
        return Path(source: self, destination: controller)
    }

//    func toVC3() -> Edge {
//        let controller = ViewController3()
//        navigationController?.pushViewController(controller, animated: true)
//        return Edge(source: self, destination: controller)
//    }
}

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }
}

extension ViewController3: Pathable {

}
