//
//  MainViewController.swift
//  PencilApp
//
//  Created by yusaku maki on 2021/04/10.
//

import UIKit
import PencilKit

class MainViewController: UIViewController {

    private lazy var canvasView: PKCanvasView = {
        let canvasView = PKCanvasView(frame: view.frame)
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .yellow, width: 30)
        return canvasView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvasView)
    }
}
