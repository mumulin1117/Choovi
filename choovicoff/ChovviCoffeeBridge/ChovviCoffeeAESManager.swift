
import UIKit


import CommonCrypto
//AES 加密解密
struct ChovviCoffeeBridge_AESMannager {
    
    private let ChovviCoffeeBridge_aesKeyData: Data
    private let ChovviCoffeeBridge_aesIVData: Data
    
    init?() {

        guard let ChovviCoffeeBridge_key = ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_aesKey.data(using: .utf8),
                     let ChovviCoffeeBridge_iv  = ChovviCoffeeBridge_SDKConfig.shared.ChovviCoffeeBridge_aesIV.data(using: .utf8) else {
                   return nil
               }
               
               self.ChovviCoffeeBridge_aesKeyData = ChovviCoffeeBridge_key
               self.ChovviCoffeeBridge_aesIVData = ChovviCoffeeBridge_iv
    }
    
    // MARK: - 加密方法
    func ChovviCoffeeBridge_encrypt(_ ChovviCoffeeBridge_text: String) -> String? {
        guard let ChovviCoffeeBridge_data = ChovviCoffeeBridge_text.data(using: .utf8) else {
            return nil
        }
        
        let ChovviCoffeeBridge_encrypted = ChovviCoffeeBridge_aesProcess(ChovviCoffeeBridge_input: ChovviCoffeeBridge_data, ChovviCoffeeBridge_operation: kCCEncrypt)
        return ChovviCoffeeBridge_encrypted?.ChovviCoffeeBridge_hexString()
    }
    
    // MARK: - 解密方法
    func ChovviCoffeeBridge_decrypt(ChovviCoffeeBridge_base64String: String) -> String? {
        guard let ChovviCoffeeBridge_data = Data(ChovviCoffeeBridge_hexist: ChovviCoffeeBridge_base64String) else {
            return nil
        }
        
        let ChovviCoffeeBridge_cryptData = ChovviCoffeeBridge_aesProcess(ChovviCoffeeBridge_input: ChovviCoffeeBridge_data, ChovviCoffeeBridge_operation: kCCDecrypt)
        return ChovviCoffeeBridge_cryptData?.ChovviCoffeeBridge_utf8ArtString()
    }
    
    // MARK: - 核心加密/解密逻辑
    private func ChovviCoffeeBridge_aesProcess(ChovviCoffeeBridge_input: Data, ChovviCoffeeBridge_operation: Int) -> Data? {
        let ChovviCoffeeBridge_outputLength = ChovviCoffeeBridge_input.count + kCCBlockSizeAES128
        var ChovviCoffeeBridge_outputData = Data(count: ChovviCoffeeBridge_outputLength)
        
        let ChovviCoffeeBridge_keyLength = ChovviCoffeeBridge_aesKeyData.count
        let ChovviCoffeeBridge_cryptoOption = CCOptions(kCCOptionPKCS7Padding)
        
        var ChovviCoffeeBridge_movedBytes: size_t = 0
        
        let ChovviCoffeeBridge_cryptStatus = ChovviCoffeeBridge_outputData.withUnsafeMutableBytes { Richne in
            ChovviCoffeeBridge_input.withUnsafeBytes { dataBytes in
                ChovviCoffeeBridge_aesIVData.withUnsafeBytes { ivBytes in
                    ChovviCoffeeBridge_aesKeyData.withUnsafeBytes { keyBytes in
                        CCCrypt(CCOperation(ChovviCoffeeBridge_operation),
                                CCAlgorithm(kCCAlgorithmAES),
                                ChovviCoffeeBridge_cryptoOption,
                                keyBytes.baseAddress, ChovviCoffeeBridge_keyLength,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, ChovviCoffeeBridge_input.count,
                                Richne.baseAddress, ChovviCoffeeBridge_outputLength,
                                &ChovviCoffeeBridge_movedBytes)
                    }
                }
            }
        }
        
        if ChovviCoffeeBridge_cryptStatus == kCCSuccess {
            ChovviCoffeeBridge_outputData.removeSubrange(ChovviCoffeeBridge_movedBytes..<ChovviCoffeeBridge_outputData.count)
            return ChovviCoffeeBridge_outputData
        } else {
           
            return nil
        }
    }
}
