//
//  RandomMessageService.swift
//  ServiceLocator
//
//  Created by Sushant Verma on 12/3/2025.
//

class RandomMessageService: MessageService {
    
    var messages: [Message]
    
    init() {
        let messageBank = Resolver.shared.resolve(MessageBank.self)
        self.messages = messageBank.messages
    }
    
    func getMessage() -> Message {
        return messages.randomElement()!
    }
}
