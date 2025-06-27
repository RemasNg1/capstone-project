import UIKit
import Flutter
import GoogleMaps 

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

  
  // GMSServices.provideAPIKey("AIzaSyCS-lT75x1XLXlvC0s_pQhQPYnRhTr58Yc")
    // GMSServices.provideAPIKey(GOOGLE_MAPS_IOS_KEY)
    GMSServices.provideAPIKey("")
    

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
