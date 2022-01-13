//
//  ContentView.swift
//  SwipeActions
//
//  Created by Federico on 13/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var nameList = ["Mario", "Luigi", "Toad", "Peach", "Bowser"]
    
    var body: some View {
        VStack {
            List {
                ForEach(nameList, id: \.self) { name in
                    Text(name)
                        .padding()
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    removeName(name: name)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                        }
                        .swipeActions {
                            Button {
                                // Edit something
                            } label: {
                                Label("Edit", systemImage: "square.and.pencil")
                            }
                            .tint(.blue)
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                // Add Logic
                            } label: {
                                Label("Add", systemImage: "mic.fill")
                            }
                            .tint(.green)
                        }
                }
            }
        }
    }
    
    func removeName(name: String) {
        if let index = nameList.firstIndex(of: name) {
            nameList.remove(at: index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
