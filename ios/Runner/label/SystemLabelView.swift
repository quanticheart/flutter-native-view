//
//  SystemLabelView.swift
//  Runner
//
//  Created by Jonn Alves on 06/01/23.
//
import Foundation
import Flutter

class SystemLabelView: NSObject, FlutterPlatformView {
    private var _view: UIView
    private let arguments: Dictionary<String, Any>?
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments: Dictionary<String, Any>?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        self.arguments = arguments
        _view = UIView()
        super.init()
        // iOS views can be created here
        createNativeView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    func createNativeView(view _view: UIView){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        _view.backgroundColor = UIColor.blue
        let nativeLabel = UILabel()
        nativeLabel.text = "Native text from iOS => \(arguments?["text"] ?? "empty from flutter")"
        nativeLabel.textColor = UIColor.white
        nativeLabel.textAlignment = .center
        nativeLabel.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 16)
        _view.addSubview(nativeLabel)
    }
}


