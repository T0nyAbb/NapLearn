import Foundation

struct Deck: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var monumentId: [Int]
    var monuments: [Monument] { Constants.monuments.filter { monumentId.contains($0.id)}
    }
}
