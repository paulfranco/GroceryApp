//
//  FirestoreManager.swift
//  GroceryApp
//
//  Created by Paul Franco on 3/24/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class FirestoreManager {
    private var db: Firestore
    
    init() {
        db = Firestore.firestore()
    }
    
    // Completion closure because saving is an async operation
    func save(store: Store, completion: @escaping (Result<Store?, Error>) -> Void) {
        do {
            let ref = try? db.collection("stores").addDocument(from: store)
            ref!.getDocument { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    completion(.failure(error!))
                    return
                }
                
                let store = try? snapshot.data(as: Store.self)
                completion(.success(store))
            }
        } catch let error {
            completion(.failure(error))
        }
    }
}
