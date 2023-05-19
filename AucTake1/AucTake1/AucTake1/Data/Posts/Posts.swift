import SwiftUI
import URLImage




struct PostListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(posts) { post in
                    PostView(post: post)
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
