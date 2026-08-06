import Foundation

@MainActor
enum ChovviRoastReserve {
    static let roomCraftMeasure = 20

    static func availableMarks(for beanIdentity: String) -> Int {
        UserDefaults.standard.integer(forKey: reserveKey(for: beanIdentity))
    }

    @discardableResult
    static func claimRoomCraft(for beanIdentity: String) -> Bool {
        let reserveKey = reserveKey(for: beanIdentity)
        let availableMarks = UserDefaults.standard.integer(forKey: reserveKey)
        guard availableMarks >= roomCraftMeasure else { return false }
        UserDefaults.standard.set(availableMarks - roomCraftMeasure, forKey: reserveKey)
        announceReserveChange()
        return true
    }

    static func restoreRoomCraft(for beanIdentity: String) {
        let reserveKey = reserveKey(for: beanIdentity)
        let availableMarks = UserDefaults.standard.integer(forKey: reserveKey)
        UserDefaults.standard.set(availableMarks + roomCraftMeasure, forKey: reserveKey)
        announceReserveChange()
    }

    private static func reserveKey(for beanIdentity: String) -> String {
        "chovviThermalTexture.\(beanIdentity.lowercased())"
    }

    private static func announceReserveChange() {
        NotificationCenter.default.post(name: Notification.Name("chovviThermalInfusion"), object: nil)
        NotificationCenter.default.post(name: .cupKeeperUpdate, object: nil)
    }
}
