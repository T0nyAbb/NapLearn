import Foundation
import SwiftUI

final class ChatViewModel: ObservableObject {
    
    @Published var answers = Constants.categories
    @Published var availableAnswers: [String:Bool] = [:]
    @Published var messages: [ChatBubbleView] = []
    @Published var showButtons = false
    @Published var isTyping = false
    
    
    func showUserAnswer(answer: String) {
        if(answers.count == 1) {
            endChat()
        }
        print(answer.count)
        switch answer {
        case "Churches⛪️":
            showButtons = false
            isTyping = true
            messages.append(ChatBubbleView(message: "I want to know about churches!", direction: .right))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
                self.messages.append(ChatBubbleView(message: "Ah, le chiese di Napoli! 🏛️ Napoli is renowned for its stunning churches, each with its own unique charm and history. One of the most iconic is the Duomo di Napoli, or Naples Cathedral. Located in the heart of the city, this magnificent cathedral dates back to the 13th century, it features a gothic style and houses the relics of San Gennaro, the city's patron saint.🤴🏻 ", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 13.0) {
                self.messages.append(ChatBubbleView(message: "Another one is the Basilica of San Francesco di Paola. Its located in Piazza Plebiscito, you can recognize it by the 8 pillars on the front.🏛️👀", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 20.0) {
                self.messages.append(ChatBubbleView(message: "Last but not least the San Domenico Maggiore church.⛪️ Also located in the historic center of Naples, this church is a true masterpiece of Renaissance architecture. Don't miss the chance to see the tomb of the famous Italian poet, Giovanni Boccaccio inside.", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 24.0) {
                self.messages.append(ChatBubbleView(message: "These are just the most famous ones, but there are many more. I will let you discover them by yourself.👀", direction: .left))
                self.isTyping = false
            }
                
            answers.removeAll { $0 == answer }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 26.0) {
                self.showButtons = true
            }
        case "Food🍕":
             showButtons = false
            isTyping = true
            messages.append(ChatBubbleView(message: "Do you have any food recommendation?", direction: .right))
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                self.messages.append(ChatBubbleView(message: "Pizza Margherita for sure. A Neapolitan classic! 🍕 So simple yet so tasty!😋 It is named after Queen Margherita of Savoy, who visited Naples in 1889. Legend has it that the pizza was created to honor her and represent the colors of the Italian flag: red (tomato sauce), white (mozzarella cheese), and green (basil leaves). It's a patriotic and delicious tribute to Italian unity and heritage! 🍕🇮🇹👑", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 11.0) {
                self.messages.append(ChatBubbleView(message: "On the sweeter side i recommend you Roccocò! they look like baked donuts, crunchy on the outside, soft and chewy on the inside, with a hint of citrus and almond flavor.🍊🌰 They're often dusted with powdered sugar for an extra touch of sweetness.😋 Roccocò are typically enjoyed during the holiday season or as a special treat with a cup of coffee or espresso. One bite, and you'll understand why they're beloved by us Neapolitans😉", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 17.0) {
                self.messages.append(ChatBubbleView(message: "Have you ever tried sfogliatella? 🥐 It's this amazing pastry that's just out of this world! it comes in 2 variants: riccia or frolla. Riccia has those beautiful, crispy layers of pastry that are all curly and flaky on the outside, giving it that extra crunch with each bite. On the other hand, frolla has a smoother, softer texture, with the pastry layers neatly folded over the creamy ricotta filling. It's like biting into a little pillow of sweetness!😋", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 23.0) {
                self.messages.append(ChatBubbleView(message: "Honestly, you can't go wrong with either one. It just depends on whether you prefer that extra crunch or a softer bite. Why not try both and see which one steals your heart? 😉🥐❤️", direction: .left))
                self.isTyping = false
            }
            answers.removeAll { $0 == answer }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 25.0) {
                self.showButtons = true
            }
        case "Museums🏛️":
            showButtons = false
            isTyping = true
            messages.append(ChatBubbleView(message: "I want to know about museums!", direction: .right))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.messages.append(ChatBubbleView(message: "Museums you said?, well there are many...", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                self.messages.append(ChatBubbleView(message: "Starting with Museo di Capodimonte! 🏛️ This magnificent museum is a treasure trove of art and culture nestled on the Capodimonte hill overlooking Naples. Housed in the grand Bourbon palace, it boasts an impressive collection of paintings, sculptures, and decorative arts spanning centuries. It features works by famous artists like Caravaggio, Titian, and Raphael. 🎨🏰", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 17.0) {
                self.messages.append(ChatBubbleView(message: "There is also the Museo Archeologico Nazionale. It's a must visit! 🏛️🇮🇹 This museum is packed with ancient treasures, from stunning sculptures to mesmerizing mosaics. You'll feel like you've stepped back in time as you wander through its halls, soaking in all the history and culture.🏺✨", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 24.0) {
                self.messages.append(ChatBubbleView(message: "Another one is the Madre Museum, Dedicated to contemporary art, this museum features works by Italian and international artists from the 20th and 21st centuries. And lastly the Museum of San Martino, located in a former monastery overlooking the city, this museum showcases Neapolitan art and artifacts, as well as stunning views of the Bay of Naples.☀️🌊", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 28.0) {
                self.messages.append(ChatBubbleView(message: "Well if you like visiting museums, you have plenty of choice.", direction: .left))
                self.isTyping = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 30.0) {
                self.showButtons = true
            }
            answers.removeAll { $0 == answer }
        case "Shopping🛍️":
            showButtons = false
            isTyping = true
            messages.append(ChatBubbleView(message: "I love shopping! Where can i go?", direction: .right))
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.messages.append(ChatBubbleView(message: "Shopping? say no more.", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                self.messages.append(ChatBubbleView(message: "The first place that comes in my mind is Galleria Umberto I! 🛍️ From high-end boutiques to charming cafes, Galleria Umberto I has something for everyone. Whether you're in the mood for a shopping spree or just want to chill with a cup of coffee, it's the perfect place to spend an afternoon. And don't forget to look up! The glass dome overhead lets in plenty of natural light, creating a truly magical atmosphere. I bet that you'll want to snap a few photos while you're there! 📸✨", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 17.0) {
                self.messages.append(ChatBubbleView(message: "But there is also Spaccanapoli! It literally means \"Naples splitter\" and it's easy to see why, this ancient street seems to divide the city in two as it winds its way through the Centro Storico. Along its route, you'll find charming shops, lively markets, hidden churches, and some of the best pizzerias in town.✨", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 24.0) {
                self.messages.append(ChatBubbleView(message: "Lastly Quartieri Spagnoli! You'll find everything here, from markets and quirky shops to cozy cafes and delicious street food joints. It's the perfect place to get lost and discover the real Naples.", direction: .left))
                self.isTyping = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 26.0) { 
                self.showButtons = true
            }
            answers.removeAll { $0 == answer }
        case "Cool places✨":
            showButtons = false
            isTyping = true
            messages.append(ChatBubbleView(message: "Do you know any cool places to enjoy the city?", direction: .right))
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.messages.append(ChatBubbleView(message: "Naples is full of cool places!", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                self.messages.append(ChatBubbleView(message: "Like Chiostro di Santa Chiara! 🌸 This serene oasis in the heart of Naples is a hidden gem. The Santa Chiara Cloister is renowned for its stunning architecture, gardens, vibrant ceramic decorations and its columns adorned with colorful majolica tiles. It's the perfect place to escape the noise of the city.😌", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 17.0) {
                self.messages.append(ChatBubbleView(message: "Another place that i like is stazione di Toledo! 🚇 The Toledo station is a true masterpiece. Located on Linea 1, it's an underground work of art. It was designed by the Spanish architect Oscar Tusquets Blanca, the station features stunning artwork and intricate mosaics. In my opinion It's a must-see for anyone visiting Naples! 🎨🚇", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 25.0) {
                self.messages.append(ChatBubbleView(message: "And lastly my favorite one, have you heard about Terrazza sul Paradiso? 🌅 it means terrace on heaven! It's this amazing spot in Naples with the most incredible views! Seriously, you can see the whole city and the bay from up there. It's the perfect place to chill, grab a drink, and just admire the beauty of this city.🌟🍹 If you ever come to Naples you can't leave without going there at least once. ", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 30.0) {
                self.messages.append(ChatBubbleView(message: "These places are just my favorite ones, but Naples has many more of them like the Stadio Maradona, Bosco di Capodimonte, Naples Underground and so on. ", direction: .left))
                self.isTyping = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 32.0) { 
                self.showButtons = true
            }
            answers.removeAll { $0 == answer }
        case "Castles🏰":
            showButtons = false
            isTyping = true
            messages.append(ChatBubbleView(message: "I want to know about castles!", direction: .right))
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { 
                self.messages.append(ChatBubbleView(message: "If you're interested in castles, Naples has some fascinating ones to explore!✨", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 12.0) { 
                self.messages.append(ChatBubbleView(message: "One of the most iconic is Castel Nuovo or New Castle, also known as Maschio Angioino. It's right in the heart of the city and has a rich history dating back to the 13th century! it boasts a distinctive architectural style with its massive towers and grand entrance. It features a rich history, including royal weddings, political intrigue, and even a prison! You can't miss its imposing towers and beautiful architecture. 🏰✨", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 20.0) { 
                self.messages.append(ChatBubbleView(message: "Naples also has Castel dell'Ovo 🏰🥚 It's located on the picturesque waterfront of Naples, near Via Caracciolo, and offers stunning views of the Bay of Naples and Mount Vesuvius. Legend has it that the castle's name, \"Egg Castle\" comes from the poet Virgil, who placed a magical egg in its foundations. It's a must-visit if you ask me.", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 27.0) { 
                self.messages.append(ChatBubbleView(message: "Then there is Aragonese Castle 🏰 It's built on top of a volcanic rock, it connects through a bridge (Ponte Aragonese) to the Ischia Island. Its the most visited monument of the Ischia island, the Ischia Film Festival, an international film festival is held in the castle each year.🎥", direction: .left))
                self.isTyping = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 29.0) { 
                self.showButtons = true
            }
            answers.removeAll { $0 == answer }
        default:
            showButtons = false
            isTyping = true
            messages.append(ChatBubbleView(message: "Thank you for teaching me all this things about Naples!", direction: .right))
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { 
                self.messages.append(ChatBubbleView(message: "You are welcome, it was a pleasure for me😄", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) { 
                self.messages.append(ChatBubbleView(message: "Im sorry but now i have to go!", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 9.0) { 
                self.messages.append(ChatBubbleView(message: "WWDC2024 is about to start", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 12.0) { 
                self.messages.append(ChatBubbleView(message: "I hope to see you there!", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 13.0) { 
                self.messages.append(ChatBubbleView(message: "See ya! 👋🏻", direction: .left))
                self.isTyping = false
            }
            answers.removeAll { $0 == answer }
        }
    } 
    
    @ViewBuilder
    var showAvailableAnswers: some View {
            HStack {
                ForEach(answers, id: \.self) { answer in
                    Button {
                        self.showUserAnswer(answer: answer)
                    } label: {
                        Text(answer)
                            .padding()
                            .background(.ultraThickMaterial)
                            .cornerRadius(7.0)
                    }
                }
                .deferredRendering(for: 2.0)
                
            }
        }
    
    func startChat() {
        if messages.isEmpty {
            isTyping = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.messages.append(ChatBubbleView(message: "Hello there! 👋🏻", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
                self.messages.append(ChatBubbleView(message: "I'm Antonio, but you can call me Tony", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 9.0) {
                self.messages.append(ChatBubbleView(message: "So you want to learn about my beautiful city? Amazing!🤩", direction: .left))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 12.0) {
                self.messages.append(ChatBubbleView(message: "Is there something in particular that you would like to know? 🤔", direction: .left))
                self.isTyping = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 12.5) {
                self.showButtons = true
            }
        }
    }
    
    func endChat() {
        answers.append("Thank you!")
        
    }
    
}

