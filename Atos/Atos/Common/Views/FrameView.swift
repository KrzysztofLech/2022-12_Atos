//  FrameView.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

@IBDesignable
internal class FrameView: UIView {
    @IBInspectable
    internal var borderWidth: CGFloat {
        get {
            layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable
    internal var borderColor: UIColor {
        get {
            guard let cgColor = layer.borderColor else { return .red }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }

    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override internal init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
}

private extension FrameView {
    func setup() {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
