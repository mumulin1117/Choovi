

import UIKit
//钥匙串管理持久化管理 UDID 和 登录password
@objc class ChovviCoffeeBridge_KeyChainMannager: NSObject {
    
    // 钥匙串服务标识符
    private static var ChovviCoffeeBridge_serviceName: String{
        return Bundle.main.bundleIdentifier ?? ""
    }
       
       
    // 账户标识符
    private static let ChovviCoffeeBridge_deviceIDKey = ChovviCoffeeBridge_serviceName + ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_3
    private static let ChovviCoffeeBridge_passwordKey = ChovviCoffeeBridge_serviceName + ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_4
    
    // MARK: - 设备ID管理
    
    /// 获取或创建设备唯一标识符
    static func ChovviCoffeeBridge_getEquipmentOnlyID() -> String {
       
        if let ChovviCoffeeBridge_savedID = ChovviCoffeeBridge_loadFromKeychain(ChovviCoffeeBridge_account: ChovviCoffeeBridge_deviceIDKey) {
         
            return ChovviCoffeeBridge_savedID
        }
        
   
        let ChovviCoffeeBridge_newID = (UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString) +  ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_appId
       
        ChovviCoffeeBridge_saveToKeychain(ChovviCoffeeBridge_value: ChovviCoffeeBridge_newID, ChovviCoffeeBridge_account: ChovviCoffeeBridge_deviceIDKey)
       
        return ChovviCoffeeBridge_newID
    }

   
    
    // MARK: - 密码管理
    
    static func ChovviCoffeeBridge_savedUserloginpassword(_ password: String) {
        ChovviCoffeeBridge_saveToKeychain(ChovviCoffeeBridge_value: password, ChovviCoffeeBridge_account: ChovviCoffeeBridge_passwordKey)
    }

    static func ChovviCoffeeBridge_getUserloginpassword() -> String? {
        return ChovviCoffeeBridge_loadFromKeychain(ChovviCoffeeBridge_account: ChovviCoffeeBridge_passwordKey)
    }
    
    
    // MARK: - 通用钥匙串操作方法
    private static func ChovviCoffeeBridge_loadFromKeychain(ChovviCoffeeBridge_account: String) -> String? {
        let ChovviCoffeeBridge_query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: ChovviCoffeeBridge_serviceName,
            kSecAttrAccount as String: ChovviCoffeeBridge_account,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var ChovviCoffeeBridge_result: AnyObject?
        let ChovviCoffeeBridge_status = SecItemCopyMatching(ChovviCoffeeBridge_query as CFDictionary, &ChovviCoffeeBridge_result)
        
        guard ChovviCoffeeBridge_status == errSecSuccess,
              let ChovviCoffeeBridge_data = ChovviCoffeeBridge_result as? Data,
              let ChovviCoffeeBridge_value = String(data: ChovviCoffeeBridge_data, encoding: .utf8) else {
            return nil
        }
        
        return ChovviCoffeeBridge_value
    }
  
    private static func ChovviCoffeeBridge_saveToKeychain(ChovviCoffeeBridge_value: String, ChovviCoffeeBridge_account: String) {
      
        ChovviCoffeeBridge_deleteFromKeychain(ChovviCoffeeBridge_account: ChovviCoffeeBridge_account)
        
        guard let ChovviCoffeeBridge_data = ChovviCoffeeBridge_value.data(using: .utf8) else { return }
        
        let ChovviCoffeeBridge_saveQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: ChovviCoffeeBridge_serviceName,
            kSecAttrAccount as String: ChovviCoffeeBridge_account,
            kSecValueData as String: ChovviCoffeeBridge_data,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]
        
        SecItemAdd(ChovviCoffeeBridge_saveQuery as CFDictionary, nil)
    }
    
 private static func ChovviCoffeeBridge_deleteFromKeychain(ChovviCoffeeBridge_account: String) {
         
         let ChovviCoffeeBridge_deleteQuery: [String: Any] = [
             kSecClass as String: kSecClassGenericPassword,
             kSecAttrService as String: ChovviCoffeeBridge_serviceName,
             kSecAttrAccount as String: ChovviCoffeeBridge_account
         ]
         
         SecItemDelete(ChovviCoffeeBridge_deleteQuery as CFDictionary)
    
 }
       

}



extension Data {
    
    /// 将 Data 转换为十六进制字符串
    func ChovviCoffeeBridge_hexString() -> String {
        return self.map { String(format: ChovviCoffeeBridge_SDKConstString.ChovviCoffeeBridge_2, $0) }.joined()
    }
    
    
    /// 从十六进制字符串创建 Data
    init?(ChovviCoffeeBridge_hexist hex: String) {
        
        // 字符串长度必须为偶数
        guard hex.count % 2 == 0 else { return nil }
        
        let ChovviCoffeeBridge_length = hex.count / 2
        var ChovviCoffeeBridge_result = Data()
        ChovviCoffeeBridge_result.reserveCapacity(ChovviCoffeeBridge_length)
        
        var ChovviCoffeeBridge_index = hex.startIndex
        
        for _ in 0..<ChovviCoffeeBridge_length {
            let nextIndex = hex.index(ChovviCoffeeBridge_index, offsetBy: 2)
            let byteString = hex[ChovviCoffeeBridge_index..<nextIndex]
            
            guard let byte = UInt8(byteString, radix: 16) else {
                return nil
            }
            ChovviCoffeeBridge_result.append(byte)
            
            ChovviCoffeeBridge_index = nextIndex
        }
        
        self = ChovviCoffeeBridge_result
    }
    
    
    /// Data 转 UTF8 字符串
    func ChovviCoffeeBridge_utf8ArtString() -> String? {
        return String(data: self, encoding: .utf8)
    }
}
