import SwiftUI

struct CollectionView: View {
    
    @StateObject var vm = CollectionViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(Constants.decks) { deck in
                VStack(alignment: .leading) {
                    Text(deck.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(deck.monuments) { monument in
                                MonumentCardView(monument: monument)
                            }
                            
                        }
                        
                    }
                    .scrollIndicators(.hidden)
                    Divider()
                }
                .scrollIndicators(.never)
                
            }
            .navigationTitle("Collection")
        }
    }
    
    
}

#Preview {
    CollectionView()
}
