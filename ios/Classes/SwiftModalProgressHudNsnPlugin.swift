import Flutter
import UIKit

public class SwiftModalProgressHudNsnPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "modal_progress_hud_nsn", binaryMessenger: registrar.messenger())
    let instance = SwiftModalProgressHudNsnPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
