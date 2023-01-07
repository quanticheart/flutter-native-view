//
//  SystemLabelViewFactory.swift
//  Runner
//
//  Created by Jonn Alves on 06/01/23.
//

import Foundation
import Flutter
import UIKit

class SystemLabelViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messanger: FlutterBinaryMessenger
    
    init(messanger: FlutterBinaryMessenger) {
        self.messanger = messanger
        super.init()
    }
    
    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return SystemLabelView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args as! Dictionary<String, Any>?,
            binaryMessenger: messanger)
    }
    
    // For receive ARGS ** REQUIRED
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

