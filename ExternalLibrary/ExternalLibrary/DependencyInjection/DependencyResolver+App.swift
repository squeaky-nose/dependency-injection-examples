//
//  DependencyResolver+App.swift
//  ExternalLibrary
//
//  Created by Sushant Verma on 15/3/2025.
//

#if DEBUG
extension DependencyResolver {
    /// For the app
    static func forApp() -> DependencyResolver {
        let resolver = DependencyResolver.createEmpty()
        resolver.register(MessageBank.self) { _ in
            MessageBank()
        }.inObjectScope(.container)
        
        resolver.register(MessageService.self) { _ in
            return SequencedMessageService(resolver)
        }
        return resolver
    }
}
#endif
