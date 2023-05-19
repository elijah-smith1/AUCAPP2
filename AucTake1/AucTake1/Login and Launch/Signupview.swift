//
//  Signupview.swift
//  AucTake1
//
//  Created by Elijah Smith on 5/19/23.
//

import SwiftUI

// Model
struct User {
    var id: String
    var email: String
}

// ViewModel
class SignupViewModel: ObservableObject {
    @Published var user: User? = nil
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var showingAlert = false
    @Published var alertMessage: String = ""
    @Published var isNavigating = false // Track if navigation is supposed to happen

    func signUp() {
        // Implement signup logic here
    }
}

// View
 // View
struct SignupView: View {
    @StateObject private var viewModel = SignupViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("Signup for AUC network")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 50)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Email", text: $viewModel.email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
    
                    SecureField("Confirm Password", text: $viewModel.confirmPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
                }
                .padding([.leading, .trailing], 27.5)
    
                Button(action: {
                    if self.viewModel.password != self.viewModel.confirmPassword {
                        self.viewModel.alertMessage = "Passwords are supposed to match"
                        self.viewModel.showingAlert = true
                    } else {
                        viewModel.signUp()
                    }
                }) {
                    Text("Signup and Login")
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
                
                // Hidden NavigationLink
                NavigationLink(destination: Accountcreation(), isActive: $viewModel.isNavigating) {
                    // Content
                }
            }
            .navigationTitle("ON CAMP")
            .frame(maxWidth: .infinity)
        }
    }
}


struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
