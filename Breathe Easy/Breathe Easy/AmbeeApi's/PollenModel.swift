struct Pollen: Codable, Hashable {
    let message: String
    let lat: Double
    let lng: Double
    let data: [PollenData]
}

struct PollenData: Codable, Hashable {
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

struct PollenCount: Codable, Hashable {
    let grassPollen: Int
    let treePollen: Int
    let weedPollen: Int

    enum CodingKeys: String, CodingKey, Hashable {
        case grassPollen = "grass_pollen"
        case treePollen = "tree_pollen"
        case weedPollen = "weed_pollen"
    }
}

struct PollenRisk: Codable, Hashable {
    let grassPollen: String
    let treePollen: String
    let weedPollen: String

    enum CodingKeys: String, CodingKey, Hashable {
        case grassPollen = "grass_pollen"
        case treePollen = "tree_pollen"
        case weedPollen = "weed_pollen"
    }
}

struct Species: Codable, Hashable {
    let Grass: [String: Int]
    let Others: Int
    let Tree: [String: Int]
    let Weed: [String: Int]
}
