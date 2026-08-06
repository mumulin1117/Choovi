import UIKit

extension UIViewController {
    @discardableResult
    func tastingReplySelection() -> Bool {
        guard !UserDefaults.standard.bool(forKey: "choovilogin") else { return true }
        if let tastingReplyCanvas = presentedViewController as? UINavigationController,
           tastingReplyCanvas.viewControllers.first is ChovviFragrantProfile {
            return false
        }
        let tastingReplyScroll = UINavigationController(rootViewController: ChovviFragrantProfile())
        tastingReplyScroll.modalPresentationStyle = .pageSheet
        present(tastingReplyScroll, animated: true)
        return false
    }
}
