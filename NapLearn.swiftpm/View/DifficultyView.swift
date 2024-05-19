import SwiftUI
import AVFoundation

struct DifficultyView: View {
    
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    @Binding var audioPlayer: AVAudioPlayer
    @Binding var isPlaying: Bool
    
    var body: some View {
        VStack {
            Text("Choose Difficulty")
                .font(.title)
                .bold()
                .padding()
            ForEach(Constants.difficulty) { deck in
                NavigationLink(value: deck) {
                    Text(deck.name)
                        .padding()
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                        .background(.ultraThickMaterial)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
                }
            }
            .navigationDestination(for: Deck.self) { deck in
                DeckView(deck: deck, path: $path, isPlaying: $isPlaying, audioPlayer: $audioPlayer)
            }
            
        }
    }
}
