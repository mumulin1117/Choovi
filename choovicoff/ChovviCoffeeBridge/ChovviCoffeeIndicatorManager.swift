
import UIKit
//loading 提示框 控件

class ChovviCoffeeBridge_AppIndicatorMannager {
    
    static let shared = ChovviCoffeeBridge_AppIndicatorMannager()
    private var ChovviCoffeeBridge_overlayWindow: UIWindow?
       
    private var ChovviCoffeeBridge_containerView: UIView?
    private var ChovviCoffeeBridge_indicator: UIActivityIndicatorView?
    private var ChovviCoffeeBridge_messageLabel: UILabel?
    private var ChovviCoffeeBridge_iconView: UIImageView?
    // MARK: - Show Loading
    class func ChovviCoffeeBridge_show(ChovviCoffeeBridge_info:String) {
        shared.ChovviCoffeeBridge_present(ChovviCoffeeBridge_message: ChovviCoffeeBridge_info, ChovviCoffeeBridge_icon: nil, ChovviCoffeeBridge_isLoading: true)
    }
    
    // MARK: - Show Info
    class func ChovviCoffeeBridge_showInfo(ChovviCoffeeBridge_withStatus message: String) {//系统图片 不要改动
        shared.ChovviCoffeeBridge_present(ChovviCoffeeBridge_message: message, ChovviCoffeeBridge_icon: UIImage(systemName: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_5), ChovviCoffeeBridge_isLoading: false)
    }
    
    // MARK: - Show Success
    class func ChovviCoffeeBridge_showSuccess(ChovviCoffeeBridge_withStatus message: String) {//系统图片 不要改动
        shared.ChovviCoffeeBridge_present(ChovviCoffeeBridge_message: message, ChovviCoffeeBridge_icon: UIImage(systemName: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_6), ChovviCoffeeBridge_isLoading: false)
    }
    
    // MARK: - Dismiss
    class func ChovviCoffeeBridge_dismiss() {
        shared.ChovviCoffeeBridge_dismissIndicator()
    }
    
    // MARK: - Core View
    private func ChovviCoffeeBridge_present(ChovviCoffeeBridge_message: String, ChovviCoffeeBridge_icon: UIImage?, ChovviCoffeeBridge_isLoading: Bool) {
        DispatchQueue.main.async {
            self.ChovviCoffeeBridge_performDismissIndicator()
            
            let ChovviCoffeeBridge_window: UIWindow
            if let ChovviCoffeeBridge_scene = Self.ChovviCoffeeBridge_activeWindowScene() {
                ChovviCoffeeBridge_window = UIWindow(windowScene: ChovviCoffeeBridge_scene)
                ChovviCoffeeBridge_window.frame = ChovviCoffeeBridge_scene.coordinateSpace.bounds
            } else {
                ChovviCoffeeBridge_window = UIWindow(frame: UIScreen.main.bounds)
            }
            ChovviCoffeeBridge_window.windowLevel = .alert + 1
            ChovviCoffeeBridge_window.backgroundColor = .clear
            ChovviCoffeeBridge_window.rootViewController = UIViewController()
            
            let ChovviCoffeeBridge_container = UIView()
            ChovviCoffeeBridge_container.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            ChovviCoffeeBridge_container.layer.cornerRadius = 14
            ChovviCoffeeBridge_container.translatesAutoresizingMaskIntoConstraints = false
            
            let ChovviCoffeeBridge_stack = UIStackView()
            ChovviCoffeeBridge_stack.axis = .vertical
            ChovviCoffeeBridge_stack.alignment = .center
            ChovviCoffeeBridge_stack.spacing = 12
            ChovviCoffeeBridge_stack.translatesAutoresizingMaskIntoConstraints = false
            
            let ChovviCoffeeBridge_indicatorView = UIActivityIndicatorView(style: .large)
            ChovviCoffeeBridge_indicatorView.color = .white
            ChovviCoffeeBridge_indicatorView.stopAnimating()
            let ChovviCoffeeBridge_imageView = UIImageView(image: ChovviCoffeeBridge_icon)
            ChovviCoffeeBridge_imageView.tintColor = .white
            ChovviCoffeeBridge_imageView.contentMode = .scaleAspectFit
            ChovviCoffeeBridge_imageView.translatesAutoresizingMaskIntoConstraints = false
            ChovviCoffeeBridge_imageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
            ChovviCoffeeBridge_imageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
            
            let ChovviCoffeeBridge_label = UILabel()
            ChovviCoffeeBridge_label.text = ChovviCoffeeBridge_message
            ChovviCoffeeBridge_label.textColor = .white
            ChovviCoffeeBridge_label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            ChovviCoffeeBridge_label.numberOfLines = 2
            ChovviCoffeeBridge_label.textAlignment = .center
            
            if ChovviCoffeeBridge_isLoading {
                ChovviCoffeeBridge_stack.addArrangedSubview(ChovviCoffeeBridge_indicatorView)
                ChovviCoffeeBridge_indicatorView.startAnimating()
            } else if ChovviCoffeeBridge_icon != nil {
                ChovviCoffeeBridge_stack.addArrangedSubview(ChovviCoffeeBridge_imageView)
            }
            ChovviCoffeeBridge_stack.addArrangedSubview(ChovviCoffeeBridge_label)
            
            let ChovviCoffeeBridge_rootView = ChovviCoffeeBridge_window.rootViewController?.view
            ChovviCoffeeBridge_rootView?.backgroundColor = .clear
            ChovviCoffeeBridge_container.addSubview(ChovviCoffeeBridge_stack)
            ChovviCoffeeBridge_rootView?.addSubview(ChovviCoffeeBridge_container)
            
            NSLayoutConstraint.activate([
                ChovviCoffeeBridge_container.centerXAnchor.constraint(equalTo: ChovviCoffeeBridge_rootView?.centerXAnchor ?? ChovviCoffeeBridge_window.centerXAnchor),
                ChovviCoffeeBridge_container.centerYAnchor.constraint(equalTo: ChovviCoffeeBridge_rootView?.centerYAnchor ?? ChovviCoffeeBridge_window.centerYAnchor),
                ChovviCoffeeBridge_container.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
                
                ChovviCoffeeBridge_stack.topAnchor.constraint(equalTo: ChovviCoffeeBridge_container.topAnchor, constant: 20),
                ChovviCoffeeBridge_stack.bottomAnchor.constraint(equalTo: ChovviCoffeeBridge_container.bottomAnchor, constant: -20),
                ChovviCoffeeBridge_stack.leadingAnchor.constraint(equalTo: ChovviCoffeeBridge_container.leadingAnchor, constant: 16),
                ChovviCoffeeBridge_stack.trailingAnchor.constraint(equalTo: ChovviCoffeeBridge_container.trailingAnchor, constant: -16),
            ])
            
            ChovviCoffeeBridge_window.isHidden = false
            
            self.ChovviCoffeeBridge_overlayWindow = ChovviCoffeeBridge_window
            self.ChovviCoffeeBridge_containerView = ChovviCoffeeBridge_container
            self.ChovviCoffeeBridge_indicator = ChovviCoffeeBridge_indicatorView
            self.ChovviCoffeeBridge_messageLabel = ChovviCoffeeBridge_label
            self.ChovviCoffeeBridge_iconView = ChovviCoffeeBridge_imageView
            
            // 轻微缩放动画
            ChovviCoffeeBridge_container.alpha = 0
            ChovviCoffeeBridge_container.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            UIView.animate(withDuration: 0.25,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.8,
                           options: .curveEaseOut,
                           animations: {
                ChovviCoffeeBridge_container.alpha = 1
                ChovviCoffeeBridge_container.transform = .identity
            })
            
            // 自动隐藏非 loading 的提示
            if !ChovviCoffeeBridge_isLoading {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                    self?.ChovviCoffeeBridge_dismissIndicator()
                }
            }
        }
    }
        
        private func ChovviCoffeeBridge_dismissIndicator() {
            DispatchQueue.main.async {
                self.ChovviCoffeeBridge_performDismissIndicator()
            }
        }

        private func ChovviCoffeeBridge_performDismissIndicator() {
            ChovviCoffeeBridge_overlayWindow?.isHidden = true
            ChovviCoffeeBridge_overlayWindow = nil
            ChovviCoffeeBridge_containerView = nil
            ChovviCoffeeBridge_indicator?.stopAnimating()
            ChovviCoffeeBridge_indicator = nil
            ChovviCoffeeBridge_messageLabel = nil
            ChovviCoffeeBridge_iconView = nil
        }

        private static func ChovviCoffeeBridge_activeWindowScene() -> UIWindowScene? {
            if #available(iOS 13.0, *) {
                return UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .first { $0.activationState == .foregroundActive }
            }
            return nil
        }
    }
