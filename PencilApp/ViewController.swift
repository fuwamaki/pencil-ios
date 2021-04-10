//
//  ViewController.swift
//  PencilApp
//
//  Created by yusaku maki on 2021/04/10.
//

import UIKit
import PencilKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let canvas = PKCanvasView(frame: view.frame)
        canvas.drawingPolicy = .anyInput
        view.addSubview(canvas)
        canvas.tool = PKInkingTool(.marker, color: .yellow, width: 30)
    }
}
