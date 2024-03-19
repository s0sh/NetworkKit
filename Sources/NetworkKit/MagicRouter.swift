//
//  MagicRouter.swift
//  NetworkMagic
//
//  Created by Roman Bigun on 14.03.2024.
//

import Foundation

// TODO: - make significant changes according to project needings: Item, url, endpoints

struct APIConfig {
    static let baseURL = "https://api.example.com"
    static let token = ""
}

enum MagicNetworkError: Error {
    case invalidURL
    case requestFailed(statusCode: Int)
    case invalidResponse
    case dataConversionFailure
}

protocol URLRequestConvertible {
    func makeURLRequest() throws -> URLRequest
}

struct Item: Codable {
    let id: String
}

enum MagicRouter: URLRequestConvertible {
    
    case fetchItems
    case updateItem(item: Item)
    case removeItem(item: Item)
    
    var endpoint: String {
        switch self {
        case .fetchItems:
            return "/items"
        case .updateItem(let item), .removeItem(let item):
            return "/items/\(item.id)"
        }
    }
    
    var method: String {
        switch self {
        case .fetchItems:
            return "GET"
        case .updateItem:
            return "PUT"
        case .removeItem:
            return "DELETE"
        }
    }
    
    func makeURLRequest() throws -> URLRequest {
            guard let url = URL(string: APIConfig.baseURL + endpoint) else {
                throw MagicNetworkError.invalidURL
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = method
            request.allHTTPHeaderFields = handleHeaders()
            // It needs to retrive accessToken first and store it to 'accessToken' defaults
            return request
    }
    
    func handleHeaders() -> [String: String] {
        if let token = UserDefaults.standard.string(forKey: "accessToken") {
            let header = ["Authorization": "Bearer \(String(describing: token))",
                          "Charset": "utf-8",
                          "Content-Type": "application/json"]
            return header
        }
        
        #if DEBUG
            return ["Authorization": "Basic \(APIConfig.token)", "Charset": "utf-8"]
        #else
        return ["Authorization": "Basic \(APIConfig.token)", "Charset": "utf-8"]
        #endif

    }
}
