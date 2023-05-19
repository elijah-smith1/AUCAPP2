import SwiftUI

struct SocialView: View {
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical, showsIndicators: false) {
            ScrollView(.vertical, showsIndicators: false) {
                // Messages
                VStack(alignment: .leading) {
                    NavigationLink(destination: MessageListView()) {
                        Text("Messages")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 16)
                            .foregroundColor(.blue)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(messages) { message in
                                MessageCard(message: message)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal, 0)
                }
                .frame(height: UIScreen.main.bounds.height / 3 * 0.8, alignment: .top)
                .padding(.top, 45)
                .background(Color.white)
            }
            
            Divider()
                .background(Color.black)
                .padding(.horizontal)
            
            // Events
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    NavigationLink(destination: EventsListView()) {
                        Text("Events")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 16)
                            .foregroundColor(.blue)
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 16) {
                            ForEach(events) { event in
                                EventCard(event: event)
                            }
                        }
                        .padding(.vertical, 16)
                    }
                    .cornerRadius(10)
                    .padding(.horizontal, 0)
                }
                .padding(.bottom, 16)
            }
            .background(Color.white)
        }
        .edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
