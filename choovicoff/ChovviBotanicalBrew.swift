import Foundation

struct ChovviBotanicalBrew: Codable, Hashable {
    let chovviBotanicalAcidity: String
    let chovviBotanicalAeropress: String
    let chovviBotanicalAftertaste: String
    let chovviBotanicalAroma: String
    let chovviBotanicalBatch: String
    let chovviBotanicalBloom: Int
    let chovviBotanicalBody: Int
    let chovviBotanicalBrewer: [String]
    let chovviBotanicalBurr: [String]
}

struct ChovviBrightBrew: Codable, Hashable {
    let chovviBrightAcidity: String
    let chovviBrightAeropress: String
    let chovviBrightAftertaste: String
    let chovviBrightAroma: String
    let chovviBrightBatch: Int
    let chovviBrightBloom: String
    let chovviBrightBody: [String]
    let chovviBrightBrewer: [String]
}

struct ChovviCaramelBrew: Codable, Hashable {
    let chovviCaramelAcidity: String
    let chovviCaramelAeropress: String
    let chovviCaramelAftertaste: [String]
    let chovviCaramelAroma: String
    let chovviCaramelBatch: Int
    let chovviCaramelBloom: Int
    let chovviCaramelBody: String
    let chovviCaramelBrewer: [String]
    let chovviCaramelBurr: [String]
}

struct ChovviCeramicBrew: Codable, Hashable {
    let chovviCeramicAcidity: String
    let chovviCeramicAeropress: String
    let chovviCeramicAftertaste: String
    let chovviCeramicAroma: String
    let chovviCeramicBatch: Int
    let chovviCeramicBloom: Int
    let chovviCeramicBody: String
    let chovviCeramicBrewer: [String]
}

struct ChovviSilkyBrew: Codable, Hashable {
    let chovviSilkyAcidity: String
    let chovviSilkyAeropress: String
    let chovviSilkyAftertaste: String
    let chovviSilkyAroma: String
    let chovviSilkyBatch: Int
    let chovviSilkyBloom: Int
    let chovviSilkyBrewer: String
    let chovviSilkyBurr: String
}

enum ChovviCitrusBrew {
    static let roastArchiveLabel = [
        "chovviGoldenAcidity",
        "chovviGoldenAeropress",
        "chovviGoldenAftertaste",
        "chovviGoldenAroma"
    ]

    static func roastArchiveCard(_ roastArchiveRecord: String) -> String {
        let roastArchiveItem = [
            "⭐️": "chovviGoldenAcidity",
            "✨": "chovviGoldenAeropress",
            "🌤️": "chovviGoldenAftertaste",
            "☕️": "chovviGoldenAroma",
            "🌿": "chovviGoldenAcidity",
            "🌸": "chovviGoldenAeropress",
            "🥐": "chovviGoldenAroma"
        ]
        return roastArchiveItem[roastArchiveRecord] ?? roastArchiveRecord
    }

    static var roastArchiveSection: [ChovviSilkyBrew] {
        guard
            let roastArchivePreview = UserDefaults.standard.data(forKey: "chovviGranularTexture"),
            let roastArchiveTrigger = try? JSONDecoder().decode([ChovviSilkyBrew].self, from: roastArchivePreview)
        else { return [] }
        return roastArchiveTrigger
    }

    static var roastArchivePreview: [ChovviCaramelBrew] {
        guard
            let roastArchiveTrigger = UserDefaults.standard.data(forKey: "chovviSpecialtyTexture"),
            let roastArchiveLayout = try? JSONDecoder().decode([ChovviCaramelBrew].self, from: roastArchiveTrigger)
        else { return [] }
        return roastArchiveLayout
    }

    static let roastArchiveCanvas: [ChovviBotanicalBrew] = [
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-01", chovviBotanicalAeropress: "Maya Chen", chovviBotanicalAftertaste: "@mayabrews", chovviBotanicalAroma: "chovviAromaticAcidity", chovviBotanicalBatch: "Slow mornings, floral beans, and window-side cups.", chovviBotanicalBloom: 1280, chovviBotanicalBody: 386, chovviBotanicalBrewer: ["chovvi-room-01", "chovvi-room-05"], chovviBotanicalBurr: ["chovvi-user-02", "chovvi-user-04", "chovvi-user-08"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-02", chovviBotanicalAeropress: "Noah Reed", chovviBotanicalAftertaste: "@noahpours", chovviBotanicalAroma: "chovviAromaticAeropress", chovviBotanicalBatch: "Espresso notes and careful dial-ins every morning.", chovviBotanicalBloom: 942, chovviBotanicalBody: 214, chovviBotanicalBrewer: ["chovvi-room-02", "chovvi-room-06"], chovviBotanicalBurr: ["chovvi-user-01", "chovvi-user-06"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-03", chovviBotanicalAeropress: "Sofia Lane", chovviBotanicalAftertaste: "@sofialatte", chovviBotanicalAroma: "chovviAromaticAftertaste", chovviBotanicalBatch: "Latte art, ceramic cups, and calm café corners.", chovviBotanicalBloom: 1765, chovviBotanicalBody: 431, chovviBotanicalBrewer: ["chovvi-room-03"], chovviBotanicalBurr: ["chovvi-user-01", "chovvi-user-05", "chovvi-user-09"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-04", chovviBotanicalAeropress: "Ethan Cole", chovviBotanicalAftertaste: "@ethanroasts", chovviBotanicalAroma: "chovviAromaticAroma", chovviBotanicalBatch: "Learning every roast curve one batch at a time.", chovviBotanicalBloom: 823, chovviBotanicalBody: 198, chovviBotanicalBrewer: ["chovvi-room-01", "chovvi-room-02"], chovviBotanicalBurr: ["chovvi-user-02", "chovvi-user-10"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-05", chovviBotanicalAeropress: "Ava Brooks", chovviBotanicalAftertaste: "@avacafes", chovviBotanicalAroma: "chovviAromaticBatch", chovviBotanicalBatch: "Finding warm cafés and thoughtful seasonal menus.", chovviBotanicalBloom: 2110, chovviBotanicalBody: 604, chovviBotanicalBrewer: ["chovvi-room-04"], chovviBotanicalBurr: ["chovvi-user-03", "chovvi-user-11", "chovvi-user-15"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-06", chovviBotanicalAeropress: "Leo Martin", chovviBotanicalAftertaste: "@leogrinds", chovviBotanicalAroma: "chovviAromaticBloom", chovviBotanicalBatch: "Hand grinders, clean filters, and bright cups.", chovviBotanicalBloom: 734, chovviBotanicalBody: 176, chovviBotanicalBrewer: ["chovvi-room-02", "chovvi-room-06"], chovviBotanicalBurr: ["chovvi-user-02", "chovvi-user-12"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-07", chovviBotanicalAeropress: "Emma Hart", chovviBotanicalAftertaste: "@emmareads", chovviBotanicalAroma: "chovviAromaticBody", chovviBotanicalBatch: "Books, soft chairs, and coffee with long finishes.", chovviBotanicalBloom: 1496, chovviBotanicalBody: 352, chovviBotanicalBrewer: ["chovvi-room-05"], chovviBotanicalBurr: ["chovvi-user-01", "chovvi-user-14"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-08", chovviBotanicalAeropress: "Liam Stone", chovviBotanicalAftertaste: "@liamfilter", chovviBotanicalAroma: "chovviAromaticBrewer", chovviBotanicalBatch: "Weekend brews with precise ratios and gentle pours.", chovviBotanicalBloom: 1087, chovviBotanicalBody: 267, chovviBotanicalBrewer: ["chovvi-room-01", "chovvi-room-06"], chovviBotanicalBurr: ["chovvi-user-01", "chovvi-user-06", "chovvi-user-16"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-09", chovviBotanicalAeropress: "Isla Moore", chovviBotanicalAftertaste: "@islafoam", chovviBotanicalAroma: "chovviAromaticBurr", chovviBotanicalBatch: "Practicing tulips, hearts, and silky textures.", chovviBotanicalBloom: 2318, chovviBotanicalBody: 718, chovviBotanicalBrewer: ["chovvi-room-03"], chovviBotanicalBurr: ["chovvi-user-03", "chovvi-user-17"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-10", chovviBotanicalAeropress: "Owen Park", chovviBotanicalAftertaste: "@owenorigin", chovviBotanicalAroma: "chovviAromaticCafe", chovviBotanicalBatch: "Origin stories, harvest notes, and careful cupping.", chovviBotanicalBloom: 675, chovviBotanicalBody: 143, chovviBotanicalBrewer: ["chovvi-room-02"], chovviBotanicalBurr: ["chovvi-user-04", "chovvi-user-18"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-11", chovviBotanicalAeropress: "Mila Hayes", chovviBotanicalAftertaste: "@milacorners", chovviBotanicalAroma: "chovviAromaticCalibration", chovviBotanicalBatch: "Quiet interiors, wooden tables, and soft light.", chovviBotanicalBloom: 1934, chovviBotanicalBody: 522, chovviBotanicalBrewer: ["chovvi-room-04"], chovviBotanicalBurr: ["chovvi-user-05", "chovvi-user-19"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-12", chovviBotanicalAeropress: "Lucas Gray", chovviBotanicalAftertaste: "@lucaskettle", chovviBotanicalAroma: "chovviAromaticCascade", chovviBotanicalBatch: "Thermal control and repeatable home recipes.", chovviBotanicalBloom: 887, chovviBotanicalBody: 229, chovviBotanicalBrewer: ["chovvi-room-06"], chovviBotanicalBurr: ["chovvi-user-06", "chovvi-user-20"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-13", chovviBotanicalAeropress: "Nora Bell", chovviBotanicalAftertaste: "@noracocoa", chovviBotanicalAroma: "chovviAromaticChamber", chovviBotanicalBatch: "Cocoa sweetness and comforting breakfast pairings.", chovviBotanicalBloom: 1254, chovviBotanicalBody: 314, chovviBotanicalBrewer: ["chovvi-room-01", "chovvi-room-05"], chovviBotanicalBurr: ["chovvi-user-07", "chovvi-user-15"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-14", chovviBotanicalAeropress: "Henry Ross", chovviBotanicalAftertaste: "@henrypages", chovviBotanicalAroma: "chovviAromaticClarity", chovviBotanicalBatch: "A fresh chapter and a carefully brewed cup.", chovviBotanicalBloom: 1012, chovviBotanicalBody: 287, chovviBotanicalBrewer: ["chovvi-room-05"], chovviBotanicalBurr: ["chovvi-user-07", "chovvi-user-16"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-15", chovviBotanicalAeropress: "Chloe King", chovviBotanicalAftertaste: "@chloebrunch", chovviBotanicalAroma: "chovviAromaticExtraction", chovviBotanicalBatch: "Croissants, fruit, and bright morning tables.", chovviBotanicalBloom: 1586, chovviBotanicalBody: 409, chovviBotanicalBrewer: ["chovvi-room-01", "chovvi-room-04"], chovviBotanicalBurr: ["chovvi-user-05", "chovvi-user-13"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-16", chovviBotanicalAeropress: "Jack Wells", chovviBotanicalAftertaste: "@jackbrewbar", chovviBotanicalAroma: "chovviAromaticFermentation", chovviBotanicalBatch: "Building a practical coffee corner at home.", chovviBotanicalBloom: 764, chovviBotanicalBody: 192, chovviBotanicalBrewer: ["chovvi-room-06"], chovviBotanicalBurr: ["chovvi-user-08", "chovvi-user-14"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-17", chovviBotanicalAeropress: "Grace Lin", chovviBotanicalAftertaste: "@gracecrema", chovviBotanicalAroma: "chovviAromaticFilter", chovviBotanicalBatch: "Crema, café sketches, and small daily rituals.", chovviBotanicalBloom: 2043, chovviBotanicalBody: 571, chovviBotanicalBrewer: ["chovvi-room-03", "chovvi-room-04"], chovviBotanicalBurr: ["chovvi-user-09", "chovvi-user-19"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-18", chovviBotanicalAeropress: "Finn Young", chovviBotanicalAftertaste: "@finnbeans", chovviBotanicalAroma: "chovviAromaticGrinder", chovviBotanicalBatch: "Comparing varietals and writing simple tasting notes.", chovviBotanicalBloom: 698, chovviBotanicalBody: 158, chovviBotanicalBrewer: ["chovvi-room-02"], chovviBotanicalBurr: ["chovvi-user-10", "chovvi-user-20"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-19", chovviBotanicalAeropress: "Ruby Scott", chovviBotanicalAftertaste: "@rubytable", chovviBotanicalAroma: "chovviAromaticInfusion", chovviBotanicalBatch: "Seasonal cups and welcoming neighborhood cafés.", chovviBotanicalBloom: 1378, chovviBotanicalBody: 365, chovviBotanicalBrewer: ["chovvi-room-04"], chovviBotanicalBurr: ["chovvi-user-11", "chovvi-user-17"]),
        ChovviBotanicalBrew(chovviBotanicalAcidity: "chovvi-user-20", chovviBotanicalAeropress: "Theo Grant", chovviBotanicalAftertaste: "@theobloom", chovviBotanicalAroma: "chovviAromaticKettle", chovviBotanicalBatch: "Fresh bloom, clean water, and patient extraction.", chovviBotanicalBloom: 913, chovviBotanicalBody: 241, chovviBotanicalBrewer: ["chovvi-room-01", "chovvi-room-06"], chovviBotanicalBurr: ["chovvi-user-12", "chovvi-user-18"])
    ]

    static let roastArchiveScroll: [ChovviBrightBrew] = [
        ChovviBrightBrew(chovviBrightAcidity: "chovvi-room-01", chovviBrightAeropress: "Morning Brew Club", chovviBrightAftertaste: "Start your day with fresh coffee, cozy conversations, and positive vibes.", chovviBrightAroma: "chovviArtisanAcidity", chovviBrightBatch: 87, chovviBrightBloom: "chovvi-user-01", chovviBrightBody: ["chovvi-user-01", "chovvi-user-04", "chovvi-user-08", "chovvi-user-13", "chovvi-user-15", "chovvi-user-20"], chovviBrightBrewer: ["chovvi-post-01", "chovvi-clip-01"]),
        ChovviBrightBrew(chovviBrightAcidity: "chovvi-room-02", chovviBrightAeropress: "Espresso Talk", chovviBrightAftertaste: "A place for espresso fans to exchange brewing tips and daily coffee stories.", chovviBrightAroma: "chovviArtisanAeropress", chovviBrightBatch: 134, chovviBrightBloom: "chovvi-user-02", chovviBrightBody: ["chovvi-user-02", "chovvi-user-04", "chovvi-user-06", "chovvi-user-10", "chovvi-user-18"], chovviBrightBrewer: ["chovvi-post-02", "chovvi-clip-02"]),
        ChovviBrightBrew(chovviBrightAcidity: "chovvi-room-03", chovviBrightAeropress: "Latte", chovviBrightAftertaste: "Share beautiful latte art, café discoveries, and your favorite coffee moments.", chovviBrightAroma: "chovviArtisanAftertaste", chovviBrightBatch: 62, chovviBrightBloom: "chovvi-user-03", chovviBrightBody: ["chovvi-user-03", "chovvi-user-09", "chovvi-user-17"], chovviBrightBrewer: ["chovvi-post-02", "chovvi-clip-03"]),
        ChovviBrightBrew(chovviBrightAcidity: "chovvi-room-04", chovviBrightAeropress: "Café Hopping", chovviBrightAftertaste: "Discover hidden cafés, review your favorites, and inspire your next visit.", chovviBrightAroma: "chovviArtisanBatch", chovviBrightBatch: 176, chovviBrightBloom: "chovvi-user-05", chovviBrightBody: ["chovvi-user-05", "chovvi-user-11", "chovvi-user-15", "chovvi-user-17", "chovvi-user-19"], chovviBrightBrewer: ["chovvi-post-03", "chovvi-clip-04"]),
        ChovviBrightBrew(chovviBrightAcidity: "chovvi-room-05", chovviBrightAeropress: "Coffee & Books", chovviBrightAftertaste: "Slow down with a good book and your favorite cup of coffee.", chovviBrightAroma: "chovviArtisanAroma", chovviBrightBatch: 49, chovviBrightBloom: "chovvi-user-07", chovviBrightBody: ["chovvi-user-01", "chovvi-user-07", "chovvi-user-13", "chovvi-user-14"], chovviBrightBrewer: ["chovvi-post-01", "chovvi-clip-05"]),
        ChovviBrightBrew(chovviBrightAcidity: "chovvi-room-06", chovviBrightAeropress: "Brew at Home", chovviBrightAftertaste: "Share home brewing recipes, equipment, and coffee experiments.", chovviBrightAroma: "chovviArtisanBloom", chovviBrightBatch: 118, chovviBrightBloom: "chovvi-user-12", chovviBrightBody: ["chovvi-user-02", "chovvi-user-06", "chovvi-user-08", "chovvi-user-12", "chovvi-user-16", "chovvi-user-20"], chovviBrightBrewer: ["chovvi-post-06", "chovvi-clip-06"])
    ]

    static let roastArchiveHeader: [ChovviCaramelBrew] = [
        ChovviCaramelBrew(chovviCaramelAcidity: "chovvi-post-01", chovviCaramelAeropress: "chovvi-user-01", chovviCaramelAftertaste: ["chovviBaristaAcidity", "chovviBaristaAeropress", "chovviBaristaAftertaste", "chovviBaristaAroma", "chovviBaristaBatch", "chovviBaristaBloom"], chovviCaramelAroma: "A warm coffee cup by the window, sunlight, and a peaceful morning atmosphere.", chovviCaramelBatch: 128, chovviCaramelBloom: 18, chovviCaramelBody: "2026-08-03T07:40:00+08:00", chovviCaramelBrewer: ["chovvi-user-02", "chovvi-user-03", "chovvi-user-07"], chovviCaramelBurr: ["chovvi-room-01", "chovvi-room-05"]),
        ChovviCaramelBrew(chovviCaramelAcidity: "chovvi-post-02", chovviCaramelAeropress: "chovvi-user-03", chovviCaramelAftertaste: ["chovviBaristaBody", "chovviBaristaBrewer"], chovviCaramelAroma: "Close-up of a latte with beautiful heart-shaped foam art.", chovviCaramelBatch: 246, chovviCaramelBloom: 31, chovviCaramelBody: "2026-08-03T08:15:00+08:00", chovviCaramelBrewer: ["chovvi-user-01", "chovvi-user-05", "chovvi-user-09"], chovviCaramelBurr: ["chovvi-room-02", "chovvi-room-03"]),
        ChovviCaramelBrew(chovviCaramelAcidity: "chovvi-post-03", chovviCaramelAeropress: "chovvi-user-11", chovviCaramelAftertaste: ["chovviBaristaBurr", "chovviBaristaCafe", "chovviBaristaCalibration"], chovviCaramelAroma: "A quiet cafe space with wooden tables, plants, and soft lights.", chovviCaramelBatch: 174, chovviCaramelBloom: 22, chovviCaramelBody: "2026-08-02T16:20:00+08:00", chovviCaramelBrewer: ["chovvi-user-05", "chovvi-user-17", "chovvi-user-19"], chovviCaramelBurr: ["chovvi-room-04"]),
        ChovviCaramelBrew(chovviCaramelAcidity: "chovvi-post-04", chovviCaramelAeropress: "chovvi-user-05", chovviCaramelAftertaste: ["chovviBaristaCascade", "chovviBaristaChamber", "chovviBaristaClarity"], chovviCaramelAroma: "A glass of iced coffee with ice cubes on a summer cafe table.", chovviCaramelBatch: 319, chovviCaramelBloom: 44, chovviCaramelBody: "2026-08-02T13:05:00+08:00", chovviCaramelBrewer: ["chovvi-user-03", "chovvi-user-11", "chovvi-user-15"], chovviCaramelBurr: ["chovvi-room-04"]),
        ChovviCaramelBrew(chovviCaramelAcidity: "chovvi-post-05", chovviCaramelAeropress: "chovvi-user-15", chovviCaramelAftertaste: ["chovviBaristaExtraction", "chovviBaristaFermentation", "chovviBaristaFilter"], chovviCaramelAroma: "Coffee cup, croissant, toast, and a cozy breakfast setup.", chovviCaramelBatch: 208, chovviCaramelBloom: 27, chovviCaramelBody: "2026-08-02T09:10:00+08:00", chovviCaramelBrewer: ["chovvi-user-01", "chovvi-user-07", "chovvi-user-13"], chovviCaramelBurr: ["chovvi-room-01"]),
        ChovviCaramelBrew(chovviCaramelAcidity: "chovvi-post-06", chovviCaramelAeropress: "chovvi-user-16", chovviCaramelAftertaste: ["chovviBaristaGrinder", "chovviBaristaInfusion", "chovviBaristaKettle", "chovviBaristaMouthfeel"], chovviCaramelAroma: "Coffee machine, mugs, beans, and a stylish home coffee corner.", chovviCaramelBatch: 156, chovviCaramelBloom: 19, chovviCaramelBody: "2026-08-01T18:45:00+08:00", chovviCaramelBrewer: ["chovvi-user-06", "chovvi-user-08", "chovvi-user-12"], chovviCaramelBurr: ["chovvi-room-06"])
    ]

    static let roastArchiveArtwork: [ChovviCeramicBrew] = [
        ChovviCeramicBrew(chovviCeramicAcidity: "chovvi-clip-01", chovviCeramicAeropress: "chovvi-user-01", chovviCeramicAftertaste: "chovviBaristaAcidity", chovviCeramicAroma: "Golden-hour first sip", chovviCeramicBatch: 14, chovviCeramicBloom: 82, chovviCeramicBody: "00:18", chovviCeramicBrewer: ["chovvi-room-01"]),
        ChovviCeramicBrew(chovviCeramicAcidity: "chovvi-clip-02", chovviCeramicAeropress: "chovvi-user-02", chovviCeramicAftertaste: "chovviBaristaBody", chovviCeramicAroma: "Dialing in a bright espresso", chovviCeramicBatch: 23, chovviCeramicBloom: 119, chovviCeramicBody: "00:26", chovviCeramicBrewer: ["chovvi-room-02"]),
        ChovviCeramicBrew(chovviCeramicAcidity: "chovvi-clip-03", chovviCeramicAeropress: "chovvi-user-09", chovviCeramicAftertaste: "chovviBaristaBrewer", chovviCeramicAroma: "A clean heart pour", chovviCeramicBatch: 31, chovviCeramicBloom: 205, chovviCeramicBody: "00:21", chovviCeramicBrewer: ["chovvi-room-03"]),
        ChovviCeramicBrew(chovviCeramicAcidity: "chovvi-clip-04", chovviCeramicAeropress: "chovvi-user-11", chovviCeramicAftertaste: "chovviBaristaBurr", chovviCeramicAroma: "A soft-light café corner", chovviCeramicBatch: 17, chovviCeramicBloom: 97, chovviCeramicBody: "00:16", chovviCeramicBrewer: ["chovvi-room-04"]),
        ChovviCeramicBrew(chovviCeramicAcidity: "chovvi-clip-05", chovviCeramicAeropress: "chovvi-user-07", chovviCeramicAftertaste: "chovviBaristaBrewer", chovviCeramicAroma: "Coffee beside a favorite chapter", chovviCeramicBatch: 19, chovviCeramicBloom: 134, chovviCeramicBody: "00:24", chovviCeramicBrewer: ["chovvi-room-05"]),
        ChovviCeramicBrew(chovviCeramicAcidity: "chovvi-clip-06", chovviCeramicAeropress: "chovvi-user-12", chovviCeramicAftertaste: "chovviBaristaGrinder", chovviCeramicAroma: "Home brewer setup notes", chovviCeramicBatch: 28, chovviCeramicBloom: 163, chovviCeramicBody: "00:29", chovviCeramicBrewer: ["chovvi-room-06"]),
        ChovviCeramicBrew(chovviCeramicAcidity: "chovvi-clip-07", chovviCeramicAeropress: "chovvi-user-15", chovviCeramicAftertaste: "chovviBaristaExtraction", chovviCeramicAroma: "Croissant and cocoa morning", chovviCeramicBatch: 11, chovviCeramicBloom: 76, chovviCeramicBody: "00:15", chovviCeramicBrewer: ["chovvi-room-01"]),
        ChovviCeramicBrew(chovviCeramicAcidity: "chovvi-clip-08", chovviCeramicAeropress: "chovvi-user-05", chovviCeramicAftertaste: "chovviBaristaCascade", chovviCeramicAroma: "Iced coffee by the coast", chovviCeramicBatch: 36, chovviCeramicBloom: 248, chovviCeramicBody: "00:22", chovviCeramicBrewer: ["chovvi-room-04"])
    ]

    static let roastArchiveStatus: [ChovviSilkyBrew] = [
        ChovviSilkyBrew(chovviSilkyAcidity: "chovvi-clip-01", chovviSilkyAeropress: "chovvi-user-01", chovviSilkyAftertaste: "chovviSilkyAcidity", chovviSilkyAroma: "Coffee with a view after the rain.", chovviSilkyBatch: 82, chovviSilkyBloom: 14, chovviSilkyBrewer: "08/03/2026 07:40", chovviSilkyBurr: "chovviGoldenAcidity"),
        ChovviSilkyBrew(chovviSilkyAcidity: "chovvi-clip-02", chovviSilkyAeropress: "chovvi-user-03", chovviSilkyAftertaste: "chovviSilkyAeropress", chovviSilkyAroma: "A handmade latte worth slowing down for.", chovviSilkyBatch: 119, chovviSilkyBloom: 23, chovviSilkyBrewer: "08/03/2026 08:15", chovviSilkyBurr: "chovviGoldenAeropress"),
        ChovviSilkyBrew(chovviSilkyAcidity: "chovvi-clip-03", chovviSilkyAeropress: "chovvi-user-05", chovviSilkyAftertaste: "chovviSilkyAftertaste", chovviSilkyAroma: "Caramelised banana iced latte for summer.", chovviSilkyBatch: 205, chovviSilkyBloom: 31, chovviSilkyBrewer: "08/03/2026 11:20", chovviSilkyBurr: "chovviGoldenAftertaste"),
        ChovviSilkyBrew(chovviSilkyAcidity: "chovvi-clip-04", chovviSilkyAeropress: "chovvi-user-09", chovviSilkyAftertaste: "chovviSilkyAroma", chovviSilkyAroma: "Spanish iced fluffy coffee at home.", chovviSilkyBatch: 97, chovviSilkyBloom: 17, chovviSilkyBrewer: "08/02/2026 16:20", chovviSilkyBurr: "chovviGoldenAroma"),
        ChovviSilkyBrew(chovviSilkyAcidity: "chovvi-clip-05", chovviSilkyAeropress: "chovvi-user-12", chovviSilkyAftertaste: "chovviSilkyBatch", chovviSilkyAroma: "A jumbo coffee kind of morning.", chovviSilkyBatch: 134, chovviSilkyBloom: 19, chovviSilkyBrewer: "08/02/2026 09:10", chovviSilkyBurr: "chovviGoldenAcidity"),
        ChovviSilkyBrew(chovviSilkyAcidity: "chovvi-clip-06", chovviSilkyAeropress: "chovvi-user-17", chovviSilkyAftertaste: "chovviSilkyBloom", chovviSilkyAroma: "Practicing a graceful swan pour.", chovviSilkyBatch: 163, chovviSilkyBloom: 28, chovviSilkyBrewer: "08/01/2026 18:45", chovviSilkyBurr: "chovviGoldenAeropress"),
        ChovviSilkyBrew(chovviSilkyAcidity: "chovvi-clip-07", chovviSilkyAeropress: "chovvi-user-20", chovviSilkyAftertaste: "chovviSilkyBody", chovviSilkyAroma: "A better place for morning coffee.", chovviSilkyBatch: 248, chovviSilkyBloom: 36, chovviSilkyBrewer: "08/01/2026 07:25", chovviSilkyBurr: "chovviGoldenAroma")
    ]
    static let roastArchiveRoute: [ChovviSilkyBrew] = Array(roastArchiveStatus.prefix(3))
    static let roastArchiveState: [ChovviBotanicalBrew] = [
        roastArchiveCanvas[2], roastArchiveCanvas[4], roastArchiveCanvas[8],
        roastArchiveCanvas[10], roastArchiveCanvas[14], roastArchiveCanvas[16]
    ]
    static let roastArchiveRender: [ChovviCaramelBrew] = roastArchiveHeader
}
