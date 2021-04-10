//
//  MainViewController.swift
//  PencilApp
//
//  Created by yusaku maki on 2021/04/10.
//

import UIKit
import PencilKit

class MainViewController: UIViewController {

    @IBAction private func clickResetButton(_ sender: Any) {
        canvasView.drawing = PKDrawing()
    }

    @IBOutlet private weak var paintView: UIView!

    private lazy var canvasView: PKCanvasView = {
        let canvasView = PKCanvasView(frame: paintView.frame)
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .yellow, width: 30)
        return canvasView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        paintView.addSubview(canvasView)
    }
}
