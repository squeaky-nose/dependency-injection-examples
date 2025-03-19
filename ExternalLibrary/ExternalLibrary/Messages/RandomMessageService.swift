//
//  RandomMessageService.swift
//  ExternalLibrary
//
//  Created by Sushant Verma on 12/3/2025.
//

class RandomMessageService: MessageService {
    
    var messages: [Message]
    
    init(_ resolver: DependencyResolver) {
        let messageBank = resolver.resolve(MessageBank.self)
        self.messages = messageBank.messages
    }
    
    func getMessage() -> Message {
        return messages.randomElement()!
    }
}
