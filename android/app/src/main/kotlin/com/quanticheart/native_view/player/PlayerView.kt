package com.quanticheart.native_view.player

import android.content.Context
import android.util.Log
import com.google.android.exoplayer2.ExoPlayer
import com.google.android.exoplayer2.MediaItem
import com.google.android.exoplayer2.ui.StyledPlayerView
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

class PlayerView(
    private val context: Context,
    private val flutterEngine: FlutterEngine,
    private val activity: FlutterActivity,
) : PlatformView, MethodChannel.MethodCallHandler {

    private lateinit var exoPlayer: ExoPlayer
    private lateinit var playerView: StyledPlayerView
    private var channelMethod: MethodChannel
    private val methodChannelName = "playerChannelTag"
    private lateinit var playerListener: PlayerEventListener

    override fun getView(): StyledPlayerView {
        return this.playerView
    }

    override fun dispose() {
        this.exoPlayer.release()
    }

    init {
        channelMethod = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannelName)
        channelMethod.setMethodCallHandler(this)
        initPlayer()
    }

    private fun initPlayer() {
        this.exoPlayer = ExoPlayer.Builder(context)
            .setSeekForwardIncrementMs(10000)
            .setSeekBackIncrementMs(10000)
            .build()
        this.playerView = StyledPlayerView(context)
        this.playerView.player = this.exoPlayer
        this.playerView.useController = false
        this.playerListener = PlayerEventListener(this.exoPlayer, flutterEngine)
        this.exoPlayer.addListener(this.playerListener)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "initPlayer" -> {
                val arguments = call.arguments<Map<String, Any>>()
                val audioURL = arguments?.getOrElse("mediaUrl") { "" } as String
                Log.e("URL PLAYERVIEW", audioURL)
                val mediaItem: MediaItem = MediaItem.fromUri(audioURL)
                this.exoPlayer.setMediaItem(mediaItem)
                this.exoPlayer.prepare()
                result.success(true)
            }
            "pause" -> {
                this.exoPlayer.pause()
                Log.e("URL PLAYERVIEW", "pause")
                result.success(true)
            }
            "play" -> {
                this.exoPlayer.play()
                Log.e("URL PLAYERVIEW", "play")
                result.success(true)
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}