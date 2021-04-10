//
//  Toast.swift
//  PencilApp
//
//  Created by yusaku maki on 2021/04/10.
//

import UIKit

final class Toast {
    static func show(_ text: String, _ parent: UIView) {
        let label = UILabel()
        label.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = text
        label.frame = CGRect(x: parent.frame.size.width / 2 - (224 / 2),
                             y: parent.frame.size.height - 120,
                             width: 224,
                             height: 44)
        label.clipsToBounds = true
        label.layer.cornerRadius = 8.0
        label.alpha = 0.0
        parent.addSubview(label)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            label.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 1.0, delay: 2.0, options: .curveEaseOut, animations: {
                label.alpha = 0.0
            }, completion: { _ in
                label.removeFromSuperview()
            })
        })
    }
}
