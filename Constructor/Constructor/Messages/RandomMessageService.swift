//
//  RandomMessageService.swift
//  Constructor
//
//  Created by Sushant Verma on 12/3/2025.
//

class RandomMessageService: MessageService {
    
    var messages: [Message]
    
    init(messageBank: MessageBank) {
        self.messages = messageBank.messages
    }
    
    func getMessage() -> Message {
        return messages.randomElement()!
    }
}
