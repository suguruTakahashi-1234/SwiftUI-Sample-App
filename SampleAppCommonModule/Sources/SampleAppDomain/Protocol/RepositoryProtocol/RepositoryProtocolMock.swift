///
/// @Generated by Mockolo
///

import Foundation

public final class MenuRepositoryProtocolMock: MenuRepositoryProtocol {
    public init() {}

    public private(set) var fetchCallCount = 0
    public var fetchHandler: (() async throws -> ([Menu]))?
    public func fetch() async throws -> [Menu] {
        fetchCallCount += 1
        if let fetchHandler {
            return try await fetchHandler()
        }
        return [Menu]()
    }
}

public final class MenuDetailRepositoryProtocolMock: MenuDetailRepositoryProtocol {
    public init() {}

    public private(set) var fetchCallCount = 0
    public var fetchHandler: ((SampleAppDomain.Menu) async throws -> (String))?
    public func fetch(menu: SampleAppDomain.Menu) async throws -> String {
        fetchCallCount += 1
        if let fetchHandler {
            return try await fetchHandler(menu)
        }
        return ""
    }
}
