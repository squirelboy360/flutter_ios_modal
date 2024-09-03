// File: ios/Classes/SwiftFlutterIosModalPlugin.swift
import Flutter
import UIKit
import SwiftUI

public class SwiftFlutterIosModalPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_ios_modal", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterIosModalPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard call.method == "showModalSheet",
          let args = call.arguments as? [String: Any],
          let viewPath = args["viewPath"] as? String,
          let hasHeader = args["hasHeader"] as? Bool,
          let headerHeight = args["headerHeight"] as? Double else {
      result(FlutterMethodNotImplemented)
      return
    }
    
    showModalSheet(viewPath: viewPath, hasHeader: hasHeader, headerHeight: headerHeight)
    result(nil)
  }

  private func showModalSheet(viewPath: String, hasHeader: Bool, headerHeight: Double) {
    DispatchQueue.main.async {
      if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
        let flutterEngine = FlutterEngine(name: "ios_modal_engine")
        flutterEngine.run()
        
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        flutterViewController.setInitialRoute(viewPath)
        
        let modalView = UIHostingController(rootView: ModalSheetView(
          flutterViewController: flutterViewController,
          hasHeader: hasHeader,
          headerHeight: headerHeight
        ))
        
        modalView.modalPresentationStyle = .pageSheet
        if #available(iOS 15.0, *) {
          if let sheet = modalView.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
          }
        }
        
        rootViewController.present(modalView, animated: true, completion: nil)
      }
    }
  }
}

struct ModalSheetView: View {
  let flutterViewController: FlutterViewController
  let hasHeader: Bool
  let headerHeight: Double
  
  var body: some View {
    VStack(spacing: 0) {
      if hasHeader {
        Color.gray.frame(height: CGFloat(headerHeight))
      }
      FlutterViewRepresentable(flutterViewController: flutterViewController)
    }
  }
}

struct FlutterViewRepresentable: UIViewControllerRepresentable {
  let flutterViewController: FlutterViewController
  
  func makeUIViewController(context: Context) -> FlutterViewController {
    return flutterViewController
  }
  
  func updateUIViewController(_ uiViewController: FlutterViewController, context: Context) {}
}