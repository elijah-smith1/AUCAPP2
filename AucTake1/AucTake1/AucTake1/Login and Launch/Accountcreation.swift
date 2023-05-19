import SwiftUI

// ViewModel
class AccountCreationViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var username: String = ""
    @Published var bio: String = ""
    @Published var showingAlert = false
    @Published var alertMessage: String = ""

    func createAccount() {
        // Implement account creation logic here
    }
}

struct Accountcreation: View {
    @StateObject private var viewModel = AccountCreationViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Create Your Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 50)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Full Name", text: $viewModel.name)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
                        .autocapitalization(.none)
    
                    TextField("Username", text: $viewModel.username)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
    
                    TextField("Bio", text: $viewModel.bio)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
                }
                .padding([.leading, .trailing], 27.5)
    
                Button(action: {
                    viewModel.createAccount()
                }) {
                    Text("Create Account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                .alert(isPresented: $viewModel.showingAlert) {
                    Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("Got it!")))
                }
            }
            .navigationTitle("ON CAMP")
            .frame(maxWidth: .infinity)
        }
    }
}

struct Accountcreation_Previews: PreviewProvider {
    static var previews: some View {
        Accountcreation()
    }
}
