import UIKit
import Flutter
import GoogleMaps 

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

  
// GMSServices.provideAPIKey("")
 //GMSServices.provideAPIKey("")
    // GMSServices.provideAPIKey("GOOGLE_MAPS_IOS_KEY")
GMSServices.provideAPIKey("AIzaSyA7yVJuIw-yeogIlD2qTkyFFjNIchS4L3M")


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
