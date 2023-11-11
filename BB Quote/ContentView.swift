//
//  ContentView.swift
//  BB Quote
//
//  Created by Jiang Lin on 11/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            Text("Breaking bad")
                .tabItem { Label("Breaking Bad", systemImage: "tortoise") }
            Text("Call soul")
                .tabItem { Label("Better Call Saul", systemImage: "briefcase") }
        }
        .onAppear{
             UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
        
    }
}

#Preview {
    ContentView()
}
