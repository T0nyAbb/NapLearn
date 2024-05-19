import Foundation

struct Monument: Identifiable, Hashable {
    var id: Int
    var photo: String
    var name: String
    var credits: String
    var answers: [String]
    
    let randomOffset = Double.random(in: -9.0...9.0)
}

