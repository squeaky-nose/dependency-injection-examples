//
//  ExternalLibraryApp.swift
//  ExternalLibrary
//
//  Created by Sushant Verma on 12/3/2025.
//

import SwiftUI

@main
struct ExternalLibraryApp: App {
    @StateObject private var resolver = DependencyResolver.forApp() // ⬅️ Persist for app lifecycle

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView(resolver)
                    .navigationTitle("External Library")
            }
        }
    }
}
