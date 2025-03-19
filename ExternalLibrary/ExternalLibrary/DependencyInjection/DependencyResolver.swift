//
//  DependencyResolver.swift
//  ExternalLibrary
//
//  Created by Sushant Verma on 13/3/2025.
//


import Swinject
import Foundation

class DependencyResolver: ObservableObject {
    
    private let swinjectContainer = Container()

    private init() {}
    
    internal static func createEmpty() -> DependencyResolver {
        .init()
    }
    
    @discardableResult
    func register<Component>(_ type: Component.Type,
                             _ factory: @escaping (DependencyResolver) -> Component) -> ServiceEntry<Component> {
        swinjectContainer.register(type) { [weak self] _ in
            guard let self = self else { fatalError("Resolver has been deallocated") }
            return factory(self)
        }
    }
    
    func resolve<Component>() -> Component {
        swinjectContainer.resolve(Component.self)! // ❗️Force unwrap
    }
    
    func resolve<Component>(_ type: Component.Type) -> Component {
        swinjectContainer.resolve(Component.self)! // ❗️Force unwrap
    }
}
