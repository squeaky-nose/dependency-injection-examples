//
//  ContentViewModel.swift
//  ExternalLibrary
//
//  Created by Sushant Verma on 12/3/2025.
//

import Foundation
import SwiftUICore

class ContentViewModel: ObservableObject {
    
    @Published var message: Message
    
    var messageService: MessageService
    
    init(_ resolver: DependencyResolver) {
        self.messageService = resolver.resolve(MessageService.self)
        self.message = messageService.getMessage()
    }
    
    func updateMessage() {
        message = messageService.getMessage()
    }
}
