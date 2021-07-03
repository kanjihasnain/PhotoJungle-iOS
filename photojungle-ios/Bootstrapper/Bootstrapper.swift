//
//  Bootstrapper.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 01/07/2021.
//

import UIKit
import Foundation

// MARK: A Struct Is Used Here To Get Control and Start The App Programtically
struct Bootstrapper {
    
    var window: UIWindow
    static var instance: Bootstrapper?
    
    private init(window: UIWindow) {
        self.window = window
    }
    
    static func initialize(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) {
        instance = Bootstrapper(window: makeNewWindow())
        instance!.bootstrap()
    }
    
    mutating func bootstrap() {
        // MARK: /* A Setup View Controller Is Shown After Splash To Download Remote JSON, Meta Or Any Other Remote Data Required By The App To Run */
        showSetupView()
        window.makeKeyAndVisible()
    }
    
    // MARK: Can Be Used As Decision Point To Show Onboarding, Login, Home, etc.
    static func startAppAfterSetup() {
        instance!.showHome()
    }
}

extension Bootstrapper {
    
    private static func makeNewWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window = window
        }
        return window
    }
    
    private func showSetupView() {
        let controller = SetupViewRouter.createModule()
        self.window.rootViewController = controller
    }
    
    private func showHome() {
        //        let controller = HomeRouter.createModule()
        //        let navigationController = UINavigationController(rootViewController: controller)
        //        self.window.rootViewController = navigationController
    }
}

