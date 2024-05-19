import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @StateObject var vm = ContentViewModel()
    @StateObject var chatVm = ChatViewModel()
    @Binding var isPlaying: Bool
    @State var isActive: Bool = true
    @Binding var audioPlayer: AVAudioPlayer
    @State var path: NavigationPath = NavigationPath()
    
    let miniMonuments: [Monument] = [
        Constants.monuments.randomElement()!,
        Constants.monuments.randomElement()!,
        Constants.monuments.randomElement()!
        
    ]
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                CardFan(monuments: miniMonuments)
                    .scaleEffect(vm.splashScreenState == .on ? 0.5 : 1.0)
                    .padding(.top, 40)
                if vm.splashScreenState == .on {
                    VStack {
                        EmptyView()
                    }
                } else {
                        VStack {
                            NavigationLink(value: 1) {
                                Text("Play")
                                    .padding()
                                    .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                                    .background(.ultraThickMaterial)
                                    .cornerRadius(15)
                                    .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
                            }
                            NavigationLink(value: 2) {
                                Text("Learn")
                                    .padding()
                                    .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                                    .background(.ultraThickMaterial)
                                    .cornerRadius(15)
                                    .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
                            }
                            NavigationLink(value: 3) {
                                Text("Collection")
                                    .padding()
                                    .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                                    .background(.ultraThickMaterial)
                                    .cornerRadius(15)
                                    .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
                            }
                        }
                        Spacer()
                        HStack {
                            Text("Song: O'Sole Mio, E.Di Capua, F.Tarrega by Nesrality on Pixabay.com")
                                .font(.callout)
                            Spacer()
                            Button {
                                if isPlaying {
                                    self.audioPlayer.pause()
                                    self.isPlaying = false
                                } else {
                                    self.audioPlayer.play()
                                    self.isPlaying = true
                                }
                            } label: {
                                Image(systemName: isPlaying ? "speaker.wave.3.fill" : "speaker.slash.fill")
                                    .padding()
                                    .background(.ultraThickMaterial)
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
                            }
                            .onAppear {
                                self.isActive = false
                            }

                        }
                        .padding()
                        .navigationDestination(for: Int.self) { selection in
                            if selection == 1 {
                                DifficultyView(path: self.$path, audioPlayer: $audioPlayer, isPlaying: self.$isPlaying)
                            } else if selection == 2 {
                                    LearnView(chatVm: chatVm)
                            } else {
                                CollectionView()
                            }
                        }
                }
            }
            .sheet(isPresented: vm.$showOn, content: {
                ZStack {
                    Spacer()
                    OnboardingView()
                        .onAppear {
                            self.isPlaying = true
                            self.audioPlayer.play()
                        }
                }
                    
            })
            
        }
    }
}
