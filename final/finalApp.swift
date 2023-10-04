//
//  finalApp.swift
//  final
//
//  Created by Jairo Aguilar on 2/22/23.
//

import SwiftUI

@main
struct finalApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem{
                        Label("Energy", systemImage: "bolt")
                    }
                Account()
                    .tabItem{
                        Label("Account", systemImage: "person")
                    }
                
                        
                    }
            }
        }
    }
