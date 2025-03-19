//
//  SequencedMessageService.swift
//  ExternalLibrary
//
//  Created by Sushant Verma on 12/3/2025.
//

class SequencedMessageService: MessageService {
    
    var messages: [Message]
    var currentIndex = 0
    
    init(_ resolver: DependencyResolver) {
        let messageBank = resolver.resolve(MessageBank.self)
        self.messages = messageBank.messages
    }
    
    func getMessage() -> Message {
        defer {
            currentIndex = (currentIndex+1) % messages.count
        }
        return messages[currentIndex]
    }
}
