struct Pollen: Codable {
    let message: String
    let lat: Double
    let lng: Double
    let data: [PollenData]
}

struct PollenData: Codable {
    let count: PollenCount
    let risk: PollenRisk
    let species: Species
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case count = "Count"
        case risk = "Risk"
        case species = "Species"
        case updatedAt
    }
}

struct PollenCount: Codable {
    let grassPollen: Int
    let treePollen: Int
    let weedPollen: Int

    enum CodingKeys: String, CodingKey {
        case grassPollen = "grass_pollen"
        case treePollen = "tree_pollen"
        case weedPollen = "weed_pollen"
    }
}

struct PollenRisk: Codable {
    let grassPollen: String
    let treePollen: String
    let weedPollen: String

    enum CodingKeys: String, CodingKey {
        case grassPollen = "grass_pollen"
        case treePollen = "tree_pollen"
        case weedPollen = "weed_pollen"
    }
}

struct Species: Codable {
    let Grass: [String: Int]
    let Others: Int
    let Tree: [String: Int]
    let Weed: [String: Int]
}
