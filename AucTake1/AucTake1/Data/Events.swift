// Events.swift

import SwiftUI
import URLImage

struct Event: Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var author: String
    var timestamp: Date
    var likeCount: Int
    var repostCount: Int
    var commentCount: Int
    var imageURL: URL
}

var events: [Event] = [
    Event(title: "Party this Week.", content: "Biggest Backyard Bash in all of Atlanta", author: "Party Throwers", timestamp: Date(), likeCount: 694, repostCount: 0, commentCount: 33, imageURL: URL(string: "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80")!),
    Event(title: "Atlanta Fair", content: "This weekend Come on out tickets only $30", author: "Atl Fair", timestamp: Date(), likeCount: 801, repostCount: 0, commentCount: 0, imageURL: URL(string: "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80")!),
    Event(title: "Concert this week", content: "Pull up to my first concert woooo", author: "Atl Fair", timestamp: Date(), likeCount: 801, repostCount: 0, commentCount: 0, imageURL: URL(string: "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80")!)
]

struct EventCard: View {
    let event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(event.content)
                .foregroundColor(.gray)
                .lineLimit(2)
            
            Spacer()
            
            URLImage(event.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .cornerRadius(10)
            .padding(.bottom, 10)
            
            HStack {
                Image(systemName: "heart")
                    .foregroundColor(.red)
                Text("\(event.likeCount)")
                
                Image(systemName: "arrowshape.turn.up.left")
                    .foregroundColor(.green)
                Text("\(event.repostCount)")
                
                Image(systemName: "message")
                    .foregroundColor(.blue)
                Text("\(event.commentCount)")
                
                Spacer()
                
                Text("Posted by \(event.author) on \(formatTimestamp(event.timestamp))")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
    
    private func formatTimestamp(_ timestamp: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: timestamp)
    }
}
