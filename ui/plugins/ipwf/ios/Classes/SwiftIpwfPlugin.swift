import Flutter
import UIKit

public class SwiftIpwfPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ipwf", binaryMessenger: registrar.messenger())
    let instance = SwiftIpwfPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
    public static func dummyMethodToEnforceBundling() {
      dummy_method_for_dummy_xcode()
    }
}
