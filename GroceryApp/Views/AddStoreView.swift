//
//  AddStoreView.swift
//  GroceryApp
//
//  Created by Paul Franco on 3/24/21.
//

import SwiftUI

struct AddStoreView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var addStoreVM = AddStoreViewModel()
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $addStoreVM.name)
                TextField("address", text: $addStoreVM.address)
                HStack {
                    Button("Save") {
                        addStoreVM.save()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .onChange(of: addStoreVM.saved, perform: { value in
                        if value {
                            presentationMode.wrappedValue.dismiss()
                        }
                    })
                }
                Text(addStoreVM.message)
            }
        }.navigationBarItems(trailing: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
        }))
        .navigationTitle("Add New Store")
        .embedInNavigationView()
    }
}

struct AddStoreView_Previews: PreviewProvider {
    static var previews: some View {
        AddStoreView()
    }
}
