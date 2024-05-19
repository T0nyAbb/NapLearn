import Foundation

enum Constants {
    static let monuments: [Monument] = [
        .init(id: 0, photo: "0", name: "Basilica of San Francesco di Paola", credits: "Vytenis Malisauskas - Unsplash.com", answers: ["Naples Cathedral", "Santa Chiara Cloister", "Basilica of San Gennaro in Naples"]),
        .init(id: 1, photo: "1", name: "Egg Castle", credits: "Vincenzo De Simone - Unsplash.com", answers: ["New Castle", "Aragonese Castle", "Small Castle"]),
        .init(id: 2, photo: "2", name: "Galleria Umberto I", credits: "Victor Malyushev - Unsplash.com", answers: ["Galleria Santa Chiara", "Galleria San Gennaro", "Galleria San Gennaro"]),
        .init(id: 3, photo: "3", name: "Toledo Station", credits: "Mario Esposito - Unsplash.com", answers: ["Garibaldi Station", "Piscinola Station", "Museo Station"]),
        .init(id: 4, photo: "4", name: "Naples Underground", credits: "Jordan Grider - Unsplash.com", answers: ["Naples Subterranean", "Naples Graveyard", "Naples buried"]),
        .init(id: 5, photo: "5", name: "Archeological Park of Pompeii", credits: "Andy Holmes - Unsplash.com", answers: ["Naples Underground", "Archeological park of Naples", "Mount Vesuvius excavations"]),
        .init(id: 6, photo: "6", name: "San Gennaro murales", credits: "Maria Bobrova - Unsplash.com", answers: ["Maradona murales", "San Napoli murales", "San Giorgio murales"]),
        .init(id: 7, photo: "7", name: "Maradona murales", credits: "Jovan Vasiljević - Unsplash.com", answers: ["San Gennaro murales", "Cavani murales", "Ferrara murales"]),
        .init(id: 8, photo: "8", name: "Aragonese Castle", credits: "Antonio Vivace - Unsplash.com", answers: ["Egg Castle", "Ancient Castle", "New Castle"]),
        .init(id: 9, photo: "9", name: "New Castle", credits: "Ronni Kurtz - Unsplash.com", answers: ["Egg Castle", "Aragonese Castle", "Old Castle"]),
        .init(id: 10, photo: "10", name: "Roccocò", credits: "Emiliano Vittoriosi - Unsplash.com", answers: ["Chiccirichì", "Taralli", "Biscuits"]),
        .init(id: 11, photo: "11", name: "Pizza Margherita", credits: "Phillip Goldsberry - Unsplash.com", answers: ["Pizza Marinara", "Pizza Napoli", "Pizza Mozzarella"]),
        .init(id: 12, photo: "12", name: "Santa Chiara Cloister", credits: "Riccardo Tuninato - Unsplash.com", answers: ["Old Cloister", "Capodimonte Park", "Santa Chiara Park"]),
        .init(id: 13, photo: "13", name: "Naples Cathedral", credits: "Kir Shu - Unsplash.com", answers: ["Saint George Church", "Old Cloister", "Santa Chiara Cathedral"]),
         .init(id: 14, photo: "14", name: "Spaccanapoli", credits: "Gherardo Sava - Unsplash.com", answers: ["Naples Main Road", "Via Caracciolo", "Quartieri Spagnoli"]),
        .init(id: 15, photo: "15", name: "Capodimonte Museum", credits: "Valerio Giannattasio - Unsplash.com", answers: ["National Archeological Museum", "Pompeii Museum", "Naples Historic Museum"]),
        .init(id: 16, photo: "16", name: "Via Caracciolo", credits: "Daniel Eliashevskyi - Unsplash.com", answers: ["Spaccanapoli", "Quartieri Spagnoli", "Via Toledo"]),
        .init(id: 17, photo: "17", name: "Quartieri Spagnoli", credits: "Silver Ringvee - Unsplash.com", answers: ["Spaccanapoli", "Naples Market", "Via Caracciolo"])
    ]
    static let decks: [Deck] = [
        .init(id: 0, name: "Cool places✨", monumentId: [3,4,5,12,14,15]),
        .init(id: 1, name: "Castles🏰", monumentId: [1,9,8]),
        .init(id: 2, name: "Food🍕", monumentId: [10,11]),
        .init(id: 3, name: "Murales🎨", monumentId: [6,7]),
        .init(id: 4, name: "Churches⛪️", monumentId: [0,13]),
        .init(id: 5, name: "Shopping🛍️", monumentId: [2,17]),
    ]
    static let difficulty: [Deck] = [
        .init(id: 2, name: "Easy", monumentId: [1,3,4,6,9,17]),
        .init(id: 3, name: "Medium", monumentId: [0,1,3,5,7,8,10,12,14,16]),
        .init(id: 4, name: "Hard", monumentId: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17])
    ]
    static let categories: [String] = [
    "Churches⛪️", "Food🍕", "Museums🏛️", "Shopping🛍️", "Cool places✨", "Castles🏰"]
    static let cardHeight: CGFloat = 500
    static let cardWidth: CGFloat = 375
    static let minicardHeight: CGFloat = 200
    static let minicardWidth: CGFloat = 150
    static let appTitle: String = "NapLearn"
    static let appIcon: String = "Icon"
    static let nextCardAnimationLength = 1.0
    static let cardFlipAnimationLength: Double = 0.4
    static var halfFlipAnimationLength: Double { Constants.cardFlipAnimationLength / 2 }
    static let flashAnimationLength: Double = 0.33
    static let setupDuration = 1.0
    static let song = Bundle.main.path(forResource: "classical-guitar-capua-o-sole-mio-by-ftarrega-1852-1909-120766", ofType: "mp3")
        
}

