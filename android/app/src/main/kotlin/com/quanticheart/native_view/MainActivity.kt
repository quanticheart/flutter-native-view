package com.quanticheart.native_view

import com.quanticheart.native_view.extentions.registerPlatformView
import com.quanticheart.native_view.label.SystemLabelViewFactory
import com.quanticheart.native_view.player.PlayerFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

//        flutterEngine
//            .platformViewsController
//            .registry
//            .registerViewFactory("playerViewTag", PlayerFactory(flutterEngine, this))

        flutterEngine.registerPlatformView("playerViewTag", PlayerFactory(flutterEngine, this))
        flutterEngine.registerPlatformView("systemViewTag", SystemLabelViewFactory())
    }
}
