//
//  AppDelegate.swift
//  CustomSchemaLinks
//
//  Created by Thaliees on 4/16/20.
//  Copyright © 2020 Thaliees. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // Determine who sent the URL.
        let sendingAppID = options[.sourceApplication]
        print("source application = \(sendingAppID ?? "Unknown")")
        
        // Process the URL.
        guard let scheme = url.scheme,
              scheme.localizedCaseInsensitiveCompare("deep-links-universal") == .orderedSame,
              let view = url.host else { return false }
        guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
            let params = components.queryItems else {
                print("Invalid URL or path missing")
                return false
        }
        
        if let id = params.first(where: { $0.name == "id" })?.value {
            print("path = \(view)")
            print("id = \(id)")
            // Handle of the paths
            // It is possible to use the switch
            if view == "product" {
                presentDetailViewController(id)
            }
            return true
        } else {
            print("id missing")
            return false
        }
    }
    
    func presentDetailViewController(_ id: String) {
        guard let navigation = window?.rootViewController as? UINavigationController else { return }
        
        let detail = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsStoryboard") as! DetailsViewController
        detail.idItem = id
        navigation.modalPresentationStyle = .fullScreen
        navigation.pushViewController(detail, animated: true)
    }
}

