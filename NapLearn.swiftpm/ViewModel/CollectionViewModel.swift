import Foundation

final class CollectionViewModel: ObservableObject {
    @Published var cards: [Monument] = Constants.monuments
}
