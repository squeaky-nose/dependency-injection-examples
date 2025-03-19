//
//  DependencyResolver+Previews.swift
//  ExternalLibrary
//
//  Created by Sushant Verma on 13/3/2025.
//

#if DEBUG
extension DependencyResolver {
    /// For SwiftUI Preview
    static func forPreview() -> DependencyResolver {
        let resolver = DependencyResolver.forApp()
        resolver.register(MessageService.self) { _ in
            PreviewMessageService()
        }
        return resolver
    }
}
#endif
