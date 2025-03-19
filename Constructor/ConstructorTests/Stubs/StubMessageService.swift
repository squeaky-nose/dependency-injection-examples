//
//  StubMessageService.swift
//  Constructor
//
//  Created by Sushant Verma on 13/3/2025.
//

@testable import Constructor

class StubMessageService: MessageService {
    var nextMessage: Message
    var callCount = 0
    
    init(nextMessage: Message) {
        self.nextMessage = nextMessage
    }
    
    func getMessage() -> Message {
        callCount += 1
        return nextMessage
    }
}
