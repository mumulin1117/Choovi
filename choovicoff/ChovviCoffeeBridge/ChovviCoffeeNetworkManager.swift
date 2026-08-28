

import UIKit
//网络请求管理
class ChovviCoffeeBridge_NetworkMannager: NSObject {
    
     
    static let shared = ChovviCoffeeBridge_NetworkMannager()
    internal override init() {
            super.init()
        }
    // MARK: - 通用网络请求（POST）
    func ChovviCoffeeBridge_postRequest(
        _ path: String,
                ChovviCoffeeBridge_params: [String: Any],
                ChovviCoffeeBridge_isPaymentFlow: Bool = false,
                ChovviCoffeeBridge_completion: @escaping (Result<[String: Any]?, Error>) -> Void = { _ in }
    ) {
        
        // 1. 生成 URL
        guard let ChovviCoffeeBridge_requestURL = URL(string: ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_baseURL + path) else {
            return         ChovviCoffeeBridge_completion(.failure(NSError(domain: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_34, code: 400)))
        }
        
        // 2. 参数 → JSON → AES 加密
        guard let ChovviCoffeeBridge_jsonString = ChovviCoffeeBridge_NetworkMannager.ChovviCoffeeBridge_jsonString(ChovviCoffeeBridge_from:         ChovviCoffeeBridge_params),
              let ChovviCoffeeBridge_aesTool = ChovviCoffeeBridge_AESMannager(),
              let ChovviCoffeeBridge_encryptedString = ChovviCoffeeBridge_aesTool.ChovviCoffeeBridge_encrypt(ChovviCoffeeBridge_jsonString),
              let ChovviCoffeeBridge_encryptedData = ChovviCoffeeBridge_encryptedString.data(using: .utf8) else {
            return
        }
        
        // 3. 创建 URLRequest
        var ChovviCoffeeBridge_request = URLRequest(url: ChovviCoffeeBridge_requestURL)
        ChovviCoffeeBridge_request.httpMethod = ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_35
        ChovviCoffeeBridge_request.httpBody = ChovviCoffeeBridge_encryptedData
        ChovviCoffeeBridge_request.timeoutInterval = 15
        ChovviCoffeeBridge_request.setValue(ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_39, forHTTPHeaderField: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_36)
        ChovviCoffeeBridge_request.setValue(ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_appId, forHTTPHeaderField: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_37)
        ChovviCoffeeBridge_request.setValue(Bundle.main.ChovviCoffeeBridge_appVersion, forHTTPHeaderField: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_38)
        ChovviCoffeeBridge_request.setValue(ChovviCoffeeBridge_KeyChainMannager.ChovviCoffeeBridge_getEquipmentOnlyID(), forHTTPHeaderField: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_40)
        ChovviCoffeeBridge_request.setValue(Locale.current.languageCode ?? "", forHTTPHeaderField: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_41)
        ChovviCoffeeBridge_request.setValue(UserDefaults.standard.string(forKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_62 ) ?? "", forHTTPHeaderField: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_42)
        ChovviCoffeeBridge_request.setValue(UserDefaults.standard.string(forKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_61) ?? "", forHTTPHeaderField: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_43)
        
        // 4. 发送请求
        let ChovviCoffeeBridge_task = URLSession.shared.dataTask(with: ChovviCoffeeBridge_request) { data, response, error in
            
            // 网络错误
            if let ChovviCoffeeBridge_err = error {
                DispatchQueue.main.async {         ChovviCoffeeBridge_completion(.failure(ChovviCoffeeBridge_err)) }
                return
            }
            
            guard let ChovviCoffeeBridge_raw = data else {
                DispatchQueue.main.async {
                            ChovviCoffeeBridge_completion(.failure(NSError(domain: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_44, code: 1000)))
                }
                return
            }
            
            self.ChovviCoffeeBridge_handleResponse(
                ChovviCoffeeBridge_isPaymentFlow:         ChovviCoffeeBridge_isPaymentFlow,
                ChovviCoffeeBridge_rawData: ChovviCoffeeBridge_raw,
                ChovviCoffeeBridge_path: path,
                ChovviCoffeeBridge_completion:         ChovviCoffeeBridge_completion
            )
        }
        
        ChovviCoffeeBridge_task.resume()
    }

    
    // MARK: - 解析返回数据
    private func ChovviCoffeeBridge_handleResponse(
        ChovviCoffeeBridge_isPaymentFlow: Bool = false,
        ChovviCoffeeBridge_rawData: Data,
        ChovviCoffeeBridge_path: String,
        ChovviCoffeeBridge_completion: @escaping (Result<[String: Any]?, Error>) -> Void
    ) {
        do {
            // 原始 JSON
            guard let ChovviCoffeeBridge_json = try JSONSerialization.jsonObject(with: ChovviCoffeeBridge_rawData) as? [String: Any] else {
                throw NSError(domain: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_45, code: 1001)
            }
            
            print("--------request reust--------")
            print(ChovviCoffeeBridge_json)
            
            // 支付类不解析 result，只判定 code
            if ChovviCoffeeBridge_isPaymentFlow {
                guard let ChovviCoffeeBridge_code = ChovviCoffeeBridge_json[ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_46] as? String, ChovviCoffeeBridge_code == ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_47 else {
                    DispatchQueue.main.async {
                        ChovviCoffeeBridge_completion(.failure(NSError(domain: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_48, code: 1001)))
                    }
                    return
                }
                DispatchQueue.main.async { ChovviCoffeeBridge_completion(.success([:])) }
                return
            }

            // 普通接口需要解密 result
            guard let ChovviCoffeeBridge_code = ChovviCoffeeBridge_json[ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_46] as? String, ChovviCoffeeBridge_code == ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_47,
                  let ChovviCoffeeBridge_encryptedResult = ChovviCoffeeBridge_json[ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_49] as? String else {
                throw NSError(domain: ChovviCoffeeBridge_json[ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_50] as? String ?? ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_51, code: 1002)
            }

            // AES 解密
            guard let ChovviCoffeeBridge_aes = ChovviCoffeeBridge_AESMannager(),
                  let ChovviCoffeeBridge_decryptedString = ChovviCoffeeBridge_aes.ChovviCoffeeBridge_decrypt(ChovviCoffeeBridge_base64String: ChovviCoffeeBridge_encryptedResult),
                  let ChovviCoffeeBridge_decryptedData = ChovviCoffeeBridge_decryptedString.data(using: .utf8),
                  let ChovviCoffeeBridge_resultDict = try JSONSerialization.jsonObject(with: ChovviCoffeeBridge_decryptedData) as? [String: Any] else {
                throw NSError(domain: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_52, code: 1003)
            }
            
            DispatchQueue.main.async {
                ChovviCoffeeBridge_completion(.success(ChovviCoffeeBridge_resultDict))
            }
            
        } catch {
            DispatchQueue.main.async {
                ChovviCoffeeBridge_completion(.failure(error))
            }
        }
    }

    
    // MARK: - Dictionary → JSON String
    class func ChovviCoffeeBridge_jsonString(ChovviCoffeeBridge_from dict: [String: Any]) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: dict) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}


private extension Bundle {
    var ChovviCoffeeBridge_appVersion: String {
        object(forInfoDictionaryKey: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_53) as? String ?? ""
    }
}




