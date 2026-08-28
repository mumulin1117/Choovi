import StoreKit
import UIKit
class ChovviCoffeeBridge_AppStorePurchaseMananager: NSObject {
    var ChovviCoffeeBridge_transactionID: String?
    static let shared = ChovviCoffeeBridge_AppStorePurchaseMananager()
    private var ChovviCoffeeBridge_purchaseCompletion: ((Result<Void, Error>) -> Void)?
    private var ChovviCoffeeBridge_productRequest: SKProductsRequest?
    private var ChovviCoffeeBridge_receiptRefreshRequest: SKReceiptRefreshRequest?
    private var ChovviCoffeeBridge_receiptRefreshCompletion: ((Result<Data, Error>) -> Void)?
    
    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }

    func ChovviCoffeeBridge_startPurchase(ChovviCoffeeBridge_productID: String, ChovviCoffeeBridge_completion: @escaping (Result<Void, Error>) -> Void) {
        guard SKPaymentQueue.canMakePayments() else {
            DispatchQueue.main.async {
                ChovviCoffeeBridge_completion(.failure(NSError(domain: "",
                                            code: -1,
                                                      userInfo: [NSLocalizedDescriptionKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_25])))
            }
            
            return
        }
        
        self.ChovviCoffeeBridge_transactionID = nil
        self.ChovviCoffeeBridge_purchaseCompletion = ChovviCoffeeBridge_completion
        ChovviCoffeeBridge_productRequest?.cancel()
        let r = SKProductsRequest(productIdentifiers: [ChovviCoffeeBridge_productID])
        r.delegate = self
        self.ChovviCoffeeBridge_productRequest = r
        r.start()
    }

}

// MARK: - 产品请求
extension ChovviCoffeeBridge_AppStorePurchaseMananager: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        guard let p = response.products.first else {
            DispatchQueue.main.async {
                self.ChovviCoffeeBridge_purchaseCompletion?(.failure(NSError(domain: "",
                                             code: -2,
                                             userInfo: [NSLocalizedDescriptionKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_26])))
                self.ChovviCoffeeBridge_purchaseCompletion = nil
            }
            
            return
        }
        self.ChovviCoffeeBridge_productRequest = nil
        SKPaymentQueue.default().add(SKPayment(product: p))
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        if request === ChovviCoffeeBridge_receiptRefreshRequest {
            DispatchQueue.main.async {
                self.ChovviCoffeeBridge_receiptRefreshCompletion?(.failure(error))
                self.ChovviCoffeeBridge_receiptRefreshCompletion = nil
                self.ChovviCoffeeBridge_receiptRefreshRequest = nil
            }
            return
        }
        
        DispatchQueue.main.async {
            self.ChovviCoffeeBridge_purchaseCompletion?(.failure(error))
            self.ChovviCoffeeBridge_purchaseCompletion = nil
            self.ChovviCoffeeBridge_productRequest = nil
        }
        
    }
    
    func requestDidFinish(_ request: SKRequest) {
        guard request === ChovviCoffeeBridge_receiptRefreshRequest else { return }
        let ChovviCoffeeBridge_receiptData = ChovviCoffeeBridge_obtainLocalReceipt()
        DispatchQueue.main.async {
            if let ChovviCoffeeBridge_receiptData = ChovviCoffeeBridge_receiptData {
                self.ChovviCoffeeBridge_receiptRefreshCompletion?(.success(ChovviCoffeeBridge_receiptData))
            } else {
                self.ChovviCoffeeBridge_receiptRefreshCompletion?(.failure(NSError(domain: "", code: -4, userInfo: [NSLocalizedDescriptionKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_60])))
            }
            self.ChovviCoffeeBridge_receiptRefreshCompletion = nil
            self.ChovviCoffeeBridge_receiptRefreshRequest = nil
        }
    }
}

// MARK: - 交易回调
extension ChovviCoffeeBridge_AppStorePurchaseMananager: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for t in transactions {
            switch t.transactionState {
            case .purchased:

                self.ChovviCoffeeBridge_transactionID = t.transactionIdentifier
                ChovviCoffeeBridge_refreshReceiptIfNeeded { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success:
                            SKPaymentQueue.default().finishTransaction(t)
                            self.ChovviCoffeeBridge_purchaseCompletion?(.success(()))
                            self.ChovviCoffeeBridge_purchaseCompletion = nil
                        case .failure(let error):
                            self.ChovviCoffeeBridge_purchaseCompletion?(.failure(error))
                            self.ChovviCoffeeBridge_purchaseCompletion = nil
                        }
                    }
                }
                
            case .failed:
                SKPaymentQueue.default().finishTransaction(t)
                let e = (t.error as? SKError)?.code == .paymentCancelled
                ? NSError(domain: "", code: -999, userInfo: [NSLocalizedDescriptionKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_27])
                : (t.error ?? NSError(domain: "", code: -3, userInfo: [NSLocalizedDescriptionKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_28]))
                DispatchQueue.main.async {
                    self.ChovviCoffeeBridge_purchaseCompletion?(.failure(e))
                    self.ChovviCoffeeBridge_purchaseCompletion = nil
                }
                
            case .restored:
                SKPaymentQueue.default().finishTransaction(t)
            default:
                break
            }
        }
    }
}

extension ChovviCoffeeBridge_AppStorePurchaseMananager {
    
    func ChovviCoffeeBridge_obtainLocalReceipt() -> Data? {
        guard let url = Bundle.main.appStoreReceiptURL else {
            return nil
        }
        guard let ChovviCoffeeBridge_receiptData = try? Data(contentsOf: url),
              !ChovviCoffeeBridge_receiptData.isEmpty else {
            return nil
        }
        return ChovviCoffeeBridge_receiptData
    }

    private func ChovviCoffeeBridge_refreshReceiptIfNeeded(ChovviCoffeeBridge_completion: @escaping (Result<Data, Error>) -> Void) {
        if let ChovviCoffeeBridge_receiptData = ChovviCoffeeBridge_obtainLocalReceipt() {
            ChovviCoffeeBridge_completion(.success(ChovviCoffeeBridge_receiptData))
            return
        }
        
        DispatchQueue.main.async {
            self.ChovviCoffeeBridge_receiptRefreshRequest?.cancel()
            self.ChovviCoffeeBridge_receiptRefreshCompletion = ChovviCoffeeBridge_completion
            let ChovviCoffeeBridge_request = SKReceiptRefreshRequest(receiptProperties: nil)
            ChovviCoffeeBridge_request.delegate = self
            self.ChovviCoffeeBridge_receiptRefreshRequest = ChovviCoffeeBridge_request
            ChovviCoffeeBridge_request.start()
        }
    }
    
    
}
