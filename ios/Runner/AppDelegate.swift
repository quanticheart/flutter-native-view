import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        registerFlutterPlatform()
//        GeneratedPluginRegistrant.register(with: self)
        weak var registrar = self.registrar(forPlugin: "plugin")
        
        let factory = PlayerFactory(messanger: registrar!.messenger())
        self.registrar(forPlugin: "flutter-native")!.register(factory, withId: "playerViewTag")
        
        let factoryLabel = SystemLabelViewFactory(messanger: registrar!.messenger())
        self.registrar(forPlugin: "flutter-native-2")!.register(factoryLabel, withId: "systemViewTag")
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
