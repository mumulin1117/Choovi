import UIKit

extension UIViewController {
    @discardableResult
    func tastingReplySelection() -> Bool {
        guard !UserDefaults.standard.bool(forKey: "choovilogin") else { return true }
        if let tastingReplyCanvas = presentedViewController as? UINavigationController,
           tastingReplyCanvas.viewControllers.first is ChovviFragrantBrew {
            return false
        }
        let tastingReplyScroll = UINavigationController(rootViewController: ChovviFragrantBrew())
        tastingReplyScroll.modalPresentationStyle = .pageSheet
        present(tastingReplyScroll, animated: true)
        return false
    }
}
