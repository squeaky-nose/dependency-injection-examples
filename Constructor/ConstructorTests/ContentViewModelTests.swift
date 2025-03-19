//
//  ContentViewModelTests.swift
//  ConstructorTests
//
//  Created by Sushant Verma on 12/3/2025.
//

import Testing
@testable import Constructor

struct ContentViewModelTests {

    var stubMessageService: StubMessageService
    var viewModel: ContentViewModel
    
    init () async throws {
        
        self.stubMessageService = .init(nextMessage: .init(text: "initial stub message",
                                                           symbol: "globe",
                                                           tint: .red))
        self.viewModel = .init(messageService: stubMessageService)
    }
    
    @Test func initialMessage() async throws {
        #expect(viewModel.message.text == "initial stub message")
        #expect(viewModel.message.symbol == "globe")
        #expect(viewModel.message.tint == .red)
        #expect(stubMessageService.callCount == 1)
    }

    @Test func nextMessage() async throws {
        stubMessageService.nextMessage = .init(text: "test case message",
                                               symbol: "circle",
                                               tint: .orange)

        viewModel.updateMessage()
        
        #expect(viewModel.message.text == "test case message")
        #expect(viewModel.message.symbol == "circle")
        #expect(viewModel.message.tint == .orange)
        #expect(stubMessageService.callCount == 2)
    }
}
