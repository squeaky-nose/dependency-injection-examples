//
//  SortedMessageService.swift
//  ServiceLocator
//
//  Created by Sushant Verma on 12/3/2025.
//

class SortedMessageService: MessageService {
    
    var messages: [Message]
    var currentIndex = 0
    
    init() {
        let messageBank = Resolver.shared.resolve(MessageBank.self)
        self.messages = messageBank.messages.sorted { $0.text < $1.text }
    }
    
    func getMessage() -> Message {
        defer {
            currentIndex = (currentIndex+1) % messages.count
        }
        return messages[currentIndex]
    }
}
