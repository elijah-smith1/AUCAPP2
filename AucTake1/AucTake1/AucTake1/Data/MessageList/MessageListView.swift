import SwiftUI

struct MessageListView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Messages")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 16)
                .padding(.bottom, 8)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(messages) { message in
                        MessageCard(message: message)
                    }
                    
                    // Empty boxes for next chats
                    ForEach(0..<5) { _ in
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(.systemGray4))
                            .frame(height: 100)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.all)
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
    }
}
