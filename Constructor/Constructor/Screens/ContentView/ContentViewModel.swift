//
//  ContentViewModel.swift
//  Constructor
//
//  Created by Sushant Verma on 12/3/2025.
//

import Foundation
import SwiftUICore

class ContentViewModel: ObservableObject {
    
    @Published var message: Message
    
    let messageService: MessageService
    
    init(messageService: MessageService) {
        self.messageService = messageService
        self.message = messageService.getMessage()
    }
    
    func updateMessage() {
        message = messageService.getMessage()
    }
}
