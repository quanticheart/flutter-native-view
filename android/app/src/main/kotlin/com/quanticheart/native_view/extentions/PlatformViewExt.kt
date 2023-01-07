package com.quanticheart.native_view.extentions

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.platform.PlatformViewFactory

//
// Created by Jonn Alves on 06/01/23.
//
fun FlutterEngine.registerPlatformView(tag: String, factory: PlatformViewFactory) {
    this.platformViewsController
        .registry
        .registerViewFactory(tag, factory)
}