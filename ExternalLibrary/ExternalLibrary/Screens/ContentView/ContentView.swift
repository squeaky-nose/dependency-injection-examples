//
//  ContentView.swift
//  ExternalLibrary
//
//  Created by Sushant Verma on 12/3/2025.
//

import SwiftUI

struct ContentView: View {
    var resolver: DependencyResolver
    
    @StateObject var viewModel: ContentViewModel
    
    init(_ resolver: DependencyResolver) {
        self.resolver = resolver
        _viewModel = .init(wrappedValue: .init(resolver))
    }
    
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
        ContentView(.forPreview())
    }
}
