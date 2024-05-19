import SwiftUI

struct TextAnimation: View {
    let textToType = "...."
    @State private var animatedText: String = ""
    
    var body: some View {
        Text(animatedText)
        .onAppear {
            animateText()
        }
    }
    
    func animateText() {
        for (index, character) in textToType.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.50) {
                animatedText.append(character)
                if index == textToType.count - 1 {
                    retractText()
                }
            }
        }
    }
    
    func retractText() {
        animatedText = ""
        animateText()
    }
}
