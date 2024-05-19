import SwiftUI

struct LearnView: View {
    @State var shouldAnimate = false

    @StateObject var chatVm: ChatViewModel
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ScrollViewReader { reader in
                    VStack(spacing: -30) {
                        ForEach(chatVm.messages, id: \.self) { message in
                                message
                                    .transition(.scale)
                                    .offset(y: shouldAnimate ? 30 : 0)
                                    .onAppear {
                                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                                            withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 10, initialVelocity: 0)) {
                                                shouldAnimate.toggle()
                                                
                                            }
                                        }
                                        
                                    }
                        }
                        if(chatVm.isTyping) {
                            HStack {
                                TextAnimation()
                                    .padding()
                                    .background(Color(uiColor: .secondarySystemBackground))
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                                    .padding(70)
                                    Spacer()
                                }
                            }
                        chatVm.showAvailableAnswers
                            .padding(.vertical, 40)
                            .opacity(chatVm.showButtons ? 1.0 : 0.0)
                            .deferredRendering(for: 1.0)
                    }
                    .padding(.bottom, 40)
                    .onChange(of: self.chatVm.messages) { _ in 
                        withAnimation {
                            reader.scrollTo("Bottom")
                        }
                    }
                    .onAppear {
                        withAnimation {
                            reader.scrollTo("Bottom")
                        }
                    }
                    Spacer()
                    Text("")
                        .id("Bottom")
                }
                
                .navigationTitle("Learn")
                .navigationBarTitleDisplayMode(.inline)
            }
        }.onAppear {
            chatVm.startChat()
        }
    }
}
