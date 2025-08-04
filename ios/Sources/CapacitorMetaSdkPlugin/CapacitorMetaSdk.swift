import Foundation

@objc public class CapacitorMetaSdk: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
