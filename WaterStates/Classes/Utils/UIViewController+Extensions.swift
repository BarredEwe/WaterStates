import UIKit

internal extension UIViewController {
    func getModuleInput(for selectorName: String) -> Any? {
        let reflection = Mirror(reflecting: self).children
        var output: Any?

        for property in reflection {
            if property.label! == selectorName {
                output = property.value
                break
            }
        }

        return output
    }
}
