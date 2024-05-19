import SwiftUI
import AVFoundation

struct DeckView: View {
    
    let deck: Deck
    
    @StateObject var vm = DeckViewModel()
    @Binding var path: NavigationPath
    @State var isShowingConfirmation = false
    @Binding var isPlaying: Bool
    @Binding var audioPlayer: AVAudioPlayer
    
    var body: some View {
        VStack {
            if(vm.deckState == .playing || vm.deckState == .submitting) {
                Text("Guess the monument!")
                    .font(.title)
                    .padding(15)
            }
            ZStack {
                cardPile
                flashMarks
            }
            endScreen
            answerButtons
            VStack {
                if(vm.deckState == .playing || vm.deckState == .submitting) {
                Spacer()
                HStack {
                    
                        Spacer()
                        Button {
                            self.isShowingConfirmation = true
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding()
                                .foregroundColor(.red)
                                .background(.ultraThickMaterial)
                                .cornerRadius(10.0)
                                .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
                        }
                        .alert(isPresented: $isShowingConfirmation) {
                            Alert(title: Text("Quit confirmation"), message: Text("Are you sure you want to quit?"), primaryButton: .destructive(Text("Quit")) {
                                path = NavigationPath()
                            }, secondaryButton: .cancel())
                        }
                        Button {
                            if isPlaying {
                                self.audioPlayer.pause()
                                isPlaying = false
                            } else {
                                self.audioPlayer.play()
                                isPlaying = true
                            }
                        } label: {
                            Image(systemName: isPlaying ? "speaker.wave.3.fill" : "speaker.slash.fill")
                                .padding()
                                .background(.ultraThickMaterial)
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
                        }
                        .padding(10)
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .onAppear {
                vm.setupDeck(deck)
            }
        }
    }
    
    
    @ViewBuilder
    private var answerButtons: some View {
        if vm.deckState == .playing || vm.deckState == .submitting {
            VStack {
                HStack {
                    answerButton(monumentName: vm.answers[0])
                    answerButton(monumentName: vm.answers[1])
                }
                HStack {
                    answerButton(monumentName: vm.answers[2])
                    answerButton(monumentName: vm.answers[3])
                }
            }
            .padding(.top, 40)
        }
    }
    
    private func answerButton(monumentName: String) -> some View {
        Button {
            vm.submitAnswer(monumentName)
        } label: {
            Text(monumentName)
                .padding()
                .background(.ultraThickMaterial)
                .cornerRadius(7.0)
        }
        .disabled(vm.deckState != .playing)
    }
    
    private func monumentCard(monument: Monument, isTopCard: Bool) -> some View {
        cardSides(monument: monument, isTopCard: isTopCard)
            .transition(.slide)
            .zIndex(isTopCard ? 999 : 0)
            .allowsHitTesting(isTopCard ? true : false)
            .offset(x: isTopCard ? 0 : monument.randomOffset, y: isTopCard ? 0 : monument.randomOffset)
            .rotationEffect(.degrees(isTopCard ? 0 : monument.randomOffset))
    }
    
    private func cardSides(monument: Monument, isTopCard: Bool) -> some View {
        ZStack {
            FrontCardView(monument: monument)
                .rotation3DEffect(.degrees(isTopCard ? vm.rotation : 0), axis: (x: 0, y: 1, z: 0))
                .opacity(isTopCard ? vm.flipped ? 0 : 1 : 1)
            BackCardView(monument: monument)
                .rotation3DEffect(.degrees(isTopCard ? vm.rotation + 180 : 0), axis: (x: 0, y: 1, z: 0))
                .opacity(isTopCard ? vm.flipped ? 1 : 0 : 0)
        }
    }
    
    @ViewBuilder
    private var flashMarks: some View {
        if vm.deckState == .submitting {
            ZStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                    .fontWeight(.thin)
                    .font(.system(size: 200))
                    .opacity(vm.passing ? 1 : 0)
                
                Image(systemName: "x.circle")
                    .foregroundColor(.red)
                    .fontWeight(.thin)
                    .font(.system(size: 200))
                    .opacity(vm.failing ? 1 : 0)
            }
        }
    }
    
    @ViewBuilder
    private var quit: some View {
        VStack {
            if(vm.deckState == .playing || vm.deckState == .submitting) {
                Button {
                    self.isShowingConfirmation = true
                } label: {
                    Text("Quit")
                        .padding()
                        .frame(width: 200)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(7.0)
                }
                .alert(isPresented: $isShowingConfirmation) {
                    Alert(title: Text("Quit confirmation"), message: Text("Are you sure you want to quit?"), primaryButton: .destructive(Text("Quit")) {
                        path = NavigationPath()
                    }, secondaryButton: .cancel())
                }
                .padding(.top, 30)
            }
                
        }
    }
    
    @ViewBuilder
    private var endScreen: some View {
        if vm.deckState == .finished {
            Text("Results: ")
                .font(.title)
                .bold()
                .padding()
            ScrollView(.vertical) {
                    VStack {
                        ForEach(vm.stats) { statistics in
                            HStack {
                                Text(statistics.monument.name)
                                    .font(.title)
                                Image(systemName: statistics.wasCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                                    .foregroundColor(statistics.wasCorrect ? .green : .red)
                            }
                        }

                        
                    }
                    
                    .frame(maxWidth: .infinity)
                
            }
            Button {
                path = NavigationPath()
            } label: {
                Text("Quit")
                    .padding()
                    .frame(width: 200)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(7.0)
            }
            .padding(.bottom, 20)
            
           
        }
    }
}

extension DeckView {
    private var cardPile: some View {
        ZStack {
            ForEach(vm.cards.indices, id: \.self) { index in 
                monumentCard(monument: vm.cards[index], isTopCard: index == vm.cards.count-1)
            }
        }
    }
}

