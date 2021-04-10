//
//  MainViewController.swift
//  PencilApp
//
//  Created by yusaku maki on 2021/04/10.
//

import UIKit
import PencilKit
import Vision

class MainViewController: UIViewController {

    @IBAction private func clickResetButton(_ sender: Any) {
        canvasView.drawing = PKDrawing()
    }

    @IBAction private func clickCheckButton(_ sender: Any) {
        do {
            let imageRequestHandler = VNImageRequestHandler(cgImage: image.cgImage!,  options: [:])
            try imageRequestHandler.perform(recognizeTextRequest)
        } catch let error {
            print(error.localizedDescription)
        }
    }

    @IBOutlet private weak var paintView: UIView!

    private var image: UIImage {
        canvasView.drawing.image(from: canvasView.drawing.bounds, scale: 10.0)
    }

    private lazy var canvasView: PKCanvasView = {
        let canvasView = PKCanvasView(frame: paintView.frame)
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .yellow, width: 30)
        return canvasView
    }()

    private lazy var recognizeTextRequest: [VNRecognizeTextRequest] = {
        let request = VNRecognizeTextRequest(completionHandler: recognizeTextHandler)
        request.recognitionLevel = .accurate  // .accurate と .fast が選択可能
        request.recognitionLanguages = ["en_US"] // 言語を選ぶ
        request.usesLanguageCorrection = true // 訂正するかを選ぶ
        return [request]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        paintView.addSubview(canvasView)
    }

    private func recognizeTextHandler(request: VNRequest?, error: Error?) {
        guard let observations = request?.results as? [VNRecognizedTextObservation] else {
            return
        }
        observations.forEach {
            guard let bestCandidate = $0.topCandidates(1).first else {
                return
            }
            Toast.show(bestCandidate.string.lowercased(), view)
            print(bestCandidate.string) // 文字認識結果
            print(bestCandidate.confidence) // 文字認識のスコア
            print($0.boundingBox) // 文字認識の領域
        }
    }
}
