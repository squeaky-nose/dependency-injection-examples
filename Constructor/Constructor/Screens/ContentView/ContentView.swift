//
//  ContentView.swift
//  Constructor
//
//  Created by Sushant Verma on 12/3/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel(messageService: SequencedMessageService(messageBank: MessageBank()))
    
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
        ContentView()
    }
}
