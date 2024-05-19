import SwiftUI
import AVFoundation

@main
struct MyApp: App {
    
    @State var player: AVAudioPlayer
    @State var isPlaying = false
    
    init() {
        let song = Bundle.main.url(forResource: "classical-guitar-capua-o-sole-mio-by-ftarrega-1852-1909-120766", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: song!)
        player.numberOfLoops = -1
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(isPlaying: $isPlaying, audioPlayer: $player)
        }
    }
}
