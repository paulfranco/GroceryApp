//
//  View+Extensions.swift
//  GroceryApp
//
//  Created by Paul Franco on 3/24/21.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
