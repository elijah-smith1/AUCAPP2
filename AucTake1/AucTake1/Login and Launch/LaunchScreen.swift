import SwiftUI

struct LaunchView: View {
    var body: some View {
        VStack {
            Text("On Camp App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 100)
            
            LoginForm()
                .padding(.horizontal, 30)
                .padding(.top, 50)
            
            HStack {
                Text("Don't have an account?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                NavigationLink(destination: SignupView()) {
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
            }
            .padding(.top, 30)
            
            NavigationLink(destination: Forgotpasswordview()) {
                Text("Forgot Password?")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .padding(.top, 10)
            }
            
            Spacer()
        }
     
    }
}

struct LoginForm: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            
            Button(action: {
                // Perform login action here
            }) {
                Text("Log In")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10)
                    .background(Color.orange)
                    .cornerRadius(5)
            }
            .padding(.top, 20)
        }
     
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
