//
//  GroceryAppApp.swift
//  GroceryApp
//
//  Created by Paul Franco on 3/24/21.
//

import SwiftUI
import Firebase

@main
struct GroceryAppApp: App {
    
    init() {
            FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
