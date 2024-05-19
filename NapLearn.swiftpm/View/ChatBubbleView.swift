import SwiftUI

enum ChatMessageDirection {
    case left
    case right
}

struct ChatBubbleView: View, Hashable {
    
    let message: String
    let direction: ChatMessageDirection
    
    var body: some View {
        HStack {
            if direction == .right {
                Spacer()
            }
            
            Text(message)
                .padding()
                .background(direction == .left ? Color(uiColor: .secondarySystemBackground) : .blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                .listRowSeparator(.hidden)
                .overlay(alignment: direction == .left ? .bottomLeading: .bottomTrailing) {
                    Image(systemName: "arrowtriangle.down.fill")
                        .font(.title)
                        .rotationEffect(.degrees(direction == .left ? 45: -45))
                        .offset(x: direction == .left ? -10: 10, y: 10)
                        .foregroundColor(direction == .left ? Color(uiColor: .secondarySystemBackground) : .blue)
                        .overlay {
                            if direction == .left {
                                memoji
                            }
                        }
                    
                    
                }
                .padding(70)
            
            if direction == .left {
                Spacer()
            }
        }
        .offset(x: direction == .right ? 40 : 0, y: 0)
    }
    
    var memoji: some View {
        Image("memoji")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .offset(x: -50, y:50)
    }
    
    
}

