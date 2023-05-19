//
//  MainView.swift
//  AucTake1
//
//  Created by Elijah Smith on 5/19/23.
//
import SwiftUI

struct MainView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                // Tab 1
                HomeView()
                    .tabItem {
                        Text("Home")
                        Image(systemName: "house.fill")
                    }.tag(0)
                
                // Tab 2
                Text("Vendors")
                    .tabItem {
                        Text("Vendors")
                        Image(systemName: "cart.fill")
                    }.tag(1)
                
                // Tab 3
                Text("Create Post")
                    .tabItem {
                        Text("Create Post")
                        Image(systemName: "plus.square.fill")
                    }.tag(2)
                
                // Tab 4
                SocialView()
                    .tabItem {
                        Text("Social")
                        Image(systemName: "message.fill")
                    }.tag(3)
                
                // Tab 5
                Text("Profile")
                    .tabItem {
                        Text("Profile")
                        Image(systemName: "person.fill")
                    }.tag(4)
            }
            
            .navigationBarTitle("", displayMode: .inline) // Empty title
                    .navigationBarHidden(true) // Hide the entire bar
                    .navigationBarBackButtonHidden(true) // Hide only back button
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

