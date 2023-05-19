//
//  postscards.swift
//  AucTake1
//
//  Created by Elijah Smith on 5/19/23.
//
import SwiftUI
import URLImage
import Foundation
struct Post: Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var author: String
    var timestamp: Date
    var likeCount: Int
    var repostCount: Int
    var commentCount: Int
    var imageURL: URL? // Optional image URL property
}
var posts: [Post] = [
    Post(title: "Tiger picture", content: "This is a picture of a tiger.", author: "Tiger Lover", timestamp: Date(), likeCount: 694, repostCount: 0, commentCount: 33, imageURL: URL(string: "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80")),
    Post(title: "Niggas Trim", content: "Today I will present to you a 300 word essay on why niggas trim.", author: "Top Nigga", timestamp: Date(), likeCount: 801, repostCount: 0, commentCount: 0, imageURL: nil),
    Post(title: "Third Post", content: "This is the content of the third post.", author: "Alex Johnson", timestamp: Date(), likeCount: 700, repostCount: 0, commentCount: 0, imageURL: nil)
]

struct PostView: View {
    var post: Post
    @State private var isLiked = false
    @State private var isReposted = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(post.title)
                    .font(.headline)
                    .bold()
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
            }
            
            if let imageURL = post.imageURL {
                URLImage(imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                }
                .frame(height: 200)
                .padding(.vertical, 8)
            }
            
            Text(post.content)
                .font(.body)
            
            Text("Author: \(post.author)")
                .font(.caption)
            
            Text("Posted: \(formatTimestamp(post.timestamp))")
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack(spacing: 20) {
                Button(action: {
                    isLiked.toggle()
                }) {
                    Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                        .foregroundColor(isLiked ? .blue : .gray)
                    Text("\(post.likeCount)")
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    isReposted.toggle()
                }) {
                    Image(systemName: isReposted ? "arrow.2.squarepath.fill" : "arrow.2.squarepath")
                        .foregroundColor(isReposted ? .green : .gray)
                    Text("\(post.repostCount)")
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    // Add comment functionality here
                }) {
                    Image(systemName: "message")
                        .foregroundColor(.gray)
                    Text("\(post.commentCount)")
                }
                .buttonStyle(PlainButtonStyle())
            }
            .font(.caption)
            .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
    private func formatTimestamp(_ timestamp: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: timestamp)
    }
}
