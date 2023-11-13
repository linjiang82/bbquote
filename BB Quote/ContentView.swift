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
      
      QuoteView(show: Constants.BB)
        .tabItem { Label(Constants.BB, systemImage: "tortoise") }
      
      QuoteView(show: Constants.BCS)
        .tabItem { Label(Constants.BCS, systemImage: "briefcase") }
    }
    .onAppear{
      UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
    }
    
  }
}

#Preview {
  ContentView()
}
