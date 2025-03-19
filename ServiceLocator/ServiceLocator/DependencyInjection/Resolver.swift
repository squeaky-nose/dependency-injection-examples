//
//  Resolver.swift
//  ServiceLocator
//
//  Created by Sushant Verma on 13/3/2025.
//


import Foundation

class Resolver {

    static let shared = Resolver()
    var factoryDict: [String: () -> Any] = [:]
    
    private init() {
        // ⚠️ Creating dependencies in constructor for simplicity. Not advisable.
        add(MessageService.self) {
            SequencedMessageService()
        }
        
        // 💡 Resolved dependency can be a singleton too
        let sharedMessageBank = MessageBank()
        add(MessageBank.self) {
            sharedMessageBank
        }
        
        /**
         Some considerations:
         - Can use `XCODE_RUNNING_FOR_PREVIEWS` environment variable to determine if we are rendering a SwiftUI Preview
         - Similarly can inject a custom launch environment for UITests. EG (XCUIApplication).launchEnvironment["RUNNING_FOR_UI_TEST"] = "1"
         */
    }

    func add<Component>(_ type: Component.Type, _ factory: @escaping () -> Component) {
        let typeString = String(describing: type.self)
        factoryDict[typeString] = factory
    }
    
    func resolve<Component>() -> Component {
        factoryDict[String(describing: Component.self)]?() as! Component // ❗️Force unwrap
    }
    
    func resolve<Component>(_ type: Component.Type) -> Component {
        factoryDict[String(describing: Component.self)]?() as! Component // ❗️Force unwrap
    }
}
