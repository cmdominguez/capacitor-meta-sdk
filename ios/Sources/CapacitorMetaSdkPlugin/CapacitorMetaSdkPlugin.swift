import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CapacitorMetaSdkPlugin)
public class CapacitorMetaSdkPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "CapacitorMetaSdkPlugin"
    public let jsName = "CapacitorMetaSdk"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "logEvent", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = CapacitorMetaSdk()

    @objc func logEvent(_ call: CAPPluginCall) {
        guard let eventName = call.getString("eventName"), !eventName.isEmpty else {
            call.reject("eventName is required")
            return
        }
        
        guard let eventValuesObject = call.getObject("eventValues") else {
            call.reject("eventValues are required")
            return
        }
        
        // Convert JSObject to Swift Dictionary
        var eventValues: [String: Any] = [:]
        for (key, value) in eventValuesObject {
            eventValues[key] = value
        }
        
        implementation.logEvent(eventName: eventName, eventValues: eventValues)
        call.resolve()
    }
}
