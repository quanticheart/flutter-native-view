package com.quanticheart.native_view.label

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

//
// Created by Jonn Alves on 06/01/23.
//
class SystemLabelView(context: Context, id: Int, creationParams: Map<String?, Any?>?) :
    PlatformView {

    private var textView: TextView?

    init {
        textView = TextView(context).apply {
            textSize = 16f
            setBackgroundColor(Color.rgb(0, 255, 255))
            text = "Native text from Android => ${creationParams?.getOrElse("text") { "empty from flutter" }}"
        }
    }

    override fun getView(): View? {
        return textView
    }

    override fun dispose() {
        textView = null
    }
}