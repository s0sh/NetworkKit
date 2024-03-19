//
//  MagicNetworkGeteway.swift
//  NetworkMagic
//
//  Created by Roman Bigun on 14.03.2024.
//

import Foundation

protocol NetworkRepositoryProtocol {
    func fetchItems() async throws -> [Item]
    func updateItem(item: Item) async throws
    func removeItemt(item: Item) async throws
}

// MARK: - NetworkRepository

final class MagicNetworkGateway: NetworkRepositoryProtocol {
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchItems() async throws -> [Item] {
        return try await networkService.fetchItems()
    }
    
    func updateItem(item: Item) async throws {
        try await networkService.updateItem(item: item)
    }
    
    func removeItemt(item: Item) async throws {
        try await networkService.removeItem(item: item)
    }
}
