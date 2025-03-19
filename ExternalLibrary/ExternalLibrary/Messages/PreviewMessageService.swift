//
//  PreviewMessageService.swift
//  ExternalLibrary
//
//  Created by Sushant Verma on 13/3/2025.
//

import SwiftUICore

class PreviewMessageService: MessageService {
    
    private var counter = 0
    private var colors: [Color] = [.blue, .green, .yellow, .red]
    
    func getMessage() -> Message {
        defer {
            counter+=1
        }
        let colorIndex = counter % colors.count

        return Message(text: "Message #\(counter)",
                       symbol: "\(counter).circle.fill",
                       tint: colors[colorIndex])
    }
}
