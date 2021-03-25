//
//  AddStoreViewModel.swift
//  GroceryApp
//
//  Created by Paul Franco on 3/24/21.
//

import Foundation


class AddStoreViewModel: ObservableObject {
    private var firestoreManager: FirestoreManager
    @Published var saved: Bool = false
    @Published var message: String = ""
    
    var name: String = ""
    var address: String = ""
    
    init() {
        firestoreManager = FirestoreManager()
    }
    
    func save() {
        let store = Store(name: name, address: address)
        
        firestoreManager.save(store: store) { result in
            switch result {
            case .success(let store):
                // Main Thread
                DispatchQueue.main.async {
                    self.saved = store == nil ? false : true
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.message = Constants.Messages.storeSavedFailure
                }
            }
        }
    }
}
