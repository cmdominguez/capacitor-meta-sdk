import Foundation
import FBSDKCoreKit
import UIKit
import AppTrackingTransparency

@objc public class CapacitorMetaSdk: NSObject {
    
    public override init() {
        super.init()
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                if status == .authorized {
                    Settings.setAdvertiserTrackingEnabled(true)
                } else {
                    Settings.setAdvertiserTrackingEnabled(false)
                }
            }
        } else {
            Settings.setAdvertiserTrackingEnabled(true)
        }
        
        // Initialize Facebook SDK
        ApplicationDelegate.shared.application(
            UIApplication.shared,
            didFinishLaunchingWithOptions: nil
        )
        
        // Listen for app becoming active
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(applicationDidBecomeActive),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
    }
    
    @objc private func applicationDidBecomeActive() {
        AppEvents.activateApp()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc public func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
    }
    
    
    @objc public func logEvent(eventName: String, eventValues: [String: Any]) {
        AppEvents.logEvent(AppEvents.Name(eventName), parameters: eventValues)
    }
}
