//
//  ContentView.swift
//  ServiceLocator
//
//  Created by Sushant Verma on 12/3/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Button(action: {
            withAnimation {
                viewModel.updateMessage()
            }
        }, label: {
            VStack {
                Image(systemName: viewModel.message.symbol)
                    .imageScale(.large)
                Text(viewModel.message.text)
            }
            .foregroundStyle(viewModel.message.tint)
            .scaleEffect(1.5)
        })
        .padding()
    }
}

#Preview {
    NavigationStack {
        // Uses same dependencies as main app (Resolver.shared). Could use `XCODE_RUNNING_FOR_PREVIEWS` environment variable to change it.
        ContentView()
    }
}
