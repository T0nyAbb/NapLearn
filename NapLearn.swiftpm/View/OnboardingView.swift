import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .padding(10)
                        .font(.headline)
                        .foregroundColor(.secondary)
                        
                }   
                .background(
                    Circle()
                        .foregroundColor(Color(uiColor: .secondarySystemBackground))
                        
                )
                .padding(.trailing, 10)
                .padding(.top, 10)
            }
            VStack {
                Image(Constants.appIcon)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .padding()
                Text(Constants.appTitle)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Unveiling Naples Through Local Eyes")
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            VStack(alignment: .leading, spacing: 24) {
                HStack(spacing: 17) {
                    Image(systemName: "book")
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding(8)
                        .foregroundColor(.primary)
                        .background {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .foregroundColor(.blue.opacity(0.2))
                        }
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Learn")
                            .font(.title3)
                            .bold()
                        Text("Discover Naples in a fun and interactive way")
                            .font(.subheadline)
                            .lineSpacing(-10)
                    }
                }
                HStack(spacing: 17) {
                    Image(systemName: "gamecontroller")
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding(8)
                        .foregroundColor(.primary)
                        .background {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .foregroundColor(.green.opacity(0.2))
                        }
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Play")
                            .font(.title3)
                            .bold()
                        Text("Test your knowledge in a game with flash cards")
                            .font(.subheadline)
                            .lineSpacing(-10)
                    }
                }
                HStack(spacing: 17) {
                    Image(systemName: "greetingcard")
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding(8)
                        .foregroundColor(.primary)
                        .background {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .foregroundColor(.red.opacity(0.2))
                        }
                    VStack(alignment: .leading, spacing: 2) {
                        Text("View")
                            .font(.title3)
                            .bold()
                        Text("Admire monuments in a personalized collection")
                            .font(.subheadline)
                            .lineSpacing(-10)
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            HStack {
                Text("WWDC2024 Swift Student Challenge project. \n\nDeveloped by Antonio Abbatiello in Naples💙🇮🇹")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
            }
        }
    }
}

#Preview {
    OnboardingView()
}

