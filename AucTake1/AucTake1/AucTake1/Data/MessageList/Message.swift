// Messages.swift

import SwiftUI

struct Message: Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var sender: String
    var timestamp: Date
}

var messages: [Message] = [
    Message(title: "First Message", content: "Hello, how are you?", sender: "John Doe", timestamp: Date()),
    Message(title: "Second Message", content: "Let's meet up tomorrow.", sender: "Jane Smith", timestamp: Date())
]

struct MessageCard: View {
    let message: Message
    
    var body: some View {
        VStack {
            Text(message.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(message.content)
                .foregroundColor(.gray)
                .lineLimit(2)
            
            Text("Sent by \(message.sender)")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(width: 300, height: 100)
        .background(Color(.systemGray6))
        .cornerRadius(15)
        .foregroundColor(Color(.systemGray4))
   
    }
}
