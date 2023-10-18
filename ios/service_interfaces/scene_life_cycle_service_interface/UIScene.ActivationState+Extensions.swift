import UIKit

extension UIScene.ActivationState: Comparable {
    public static func < (lhs: UIScene.ActivationState, rhs: UIScene.ActivationState) -> Bool {
        if lhs == rhs {
            return false
        }

        switch lhs {
        case .unattached:
            return rhs == .background || rhs == .foregroundInactive || rhs == .foregroundActive

        case .background:
            return rhs == .foregroundInactive || rhs == .foregroundActive

        case .foregroundInactive:
            return rhs == .foregroundActive

        case .foregroundActive:
            return true
        @unknown default:
            return false
        }
    }
}
