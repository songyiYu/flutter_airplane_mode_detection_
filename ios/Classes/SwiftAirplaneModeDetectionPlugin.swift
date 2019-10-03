import Flutter
import UIKit
import Network
import NetworkExtension
import SystemConfiguration.CaptiveNetwork



@available(iOS 12.0, *)
public class SwiftAirplaneModeDetectionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "airplane_mode_detection", binaryMessenger: registrar.messenger())
    let instance = SwiftAirplaneModeDetectionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
   if (call.method == "getPlatformVersion"){
                result("iOS" + UIDevice.current.systemVersion)
            }else if (call.method == "detectAirplaneMode") {

               result(self.detectAirplaneMode())

          }

        }

          public override init() {
                super.init()
            }

            func detectAirplaneMode() -> Bool {

                    var check = true
                    let monitor = NWPathMonitor()
                     
                if monitor.currentPath.availableInterfaces.count == 0 {
                    check = true
                    print("3")
                    print("Filght Mode")
                }
                else {
                    check = false
                    print("4")
                    print("Not Flight Mode")
                }
                print("5")
                print(monitor.currentPath.availableInterfaces.count)

                //                DispatchQueue.main.async {
                               //                    // UI 작업
                               //                    self.tableView.reloadData()
                               //                }
                
                DispatchQueue.main.async {
                    
                
                    if monitor.currentPath.availableInterfaces.count == 0 {
                                      check = true
                                      print("3")
                                      print("Filght Mode")
                                  }
                                  else {
                                      check = false
                                      print("4")
                                      print("Not Flight Mode")
                                  }
                                  print("5")
                                  print(monitor.currentPath.availableInterfaces.count)
                }
          //      let queue = DispatchQueue.global(qos: .userInteractive)
          //          monitor.start(queue: queue)
                    return check
              
                }
    
}

//                test.sync {
//                    monitor.start(queue: test)
//                    monitor.pathUpdateHandler = { path in
//
//                        print("2")
//                        if path.availableInterfaces.count == 0 {
//                            check = true
//                            print("3")
//                            print("Flight mode")
//                        }
//                        else {
//                            check = false
//                            print("4")
//                            print("not Flight mode")
//                        }
//                        print("5")
//                        print(path.availableInterfaces)
//                    }
//                }
