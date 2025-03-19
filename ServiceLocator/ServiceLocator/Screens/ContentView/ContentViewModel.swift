//
//  ContentViewModel.swift
//  ServiceLocator
//
//  Created by Sushant Verma on 12/3/2025.
//

import Foundation
import SwiftUICore

class ContentViewModel: ObservableObject {
    
    @Published var message: Message
    
    var messageService: MessageService
    
    init() {
        self.messageService = Resolver.shared.resolve()
        self.message = messageService.getMessage()
    }
    
    func updateMessage() {
        message = messageService.getMessage()
    }
}
