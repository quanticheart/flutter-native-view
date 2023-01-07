//
//  PlayerFactory.swift
//  Runner
//
//  Created by Jonn Alves on 05/01/23.
//

import Foundation

class PlayerFactory : NSObject, FlutterPlatformViewFactory{
    
    private var messanger : FlutterBinaryMessenger
    init(messanger : FlutterBinaryMessenger){
        self.messanger = messanger
        super.init()
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) ->
    FlutterPlatformView{
        return PlayerView(frame:frame, viewIdentifier: viewId,arguments: args,binaryMessanger: messanger)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
    
}
