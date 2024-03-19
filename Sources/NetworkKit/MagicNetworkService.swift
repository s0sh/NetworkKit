//
//  MagicNetworkService.swift
//  NetworkMagic
//
//  Created by Roman Bigun on 14.03.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchItems() async throws -> [Item]
    func updateItem(item: Item) async throws
    func removeItem(item: Item) async throws
}

final class MagicNetworkService: BaseNetworkService<MagicRouter>, NetworkServiceProtocol {
    func fetchItems() async throws -> [Item] {
        return try await request([Item].self, router: .fetchItems)
    }
    
    func updateItem(item: Item) async throws {
        _ = try await request(Item.self, router: .updateItem(item: item))
    }
    
    func removeItem(item: Item) async throws {
        _ = try await request(Item.self, router: .removeItem(item: item))
    }
}
