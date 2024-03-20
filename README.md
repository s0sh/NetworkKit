# NetworkKit

1)Separation of Concerns: The NetworkRepository class separates the handling of network requests and responses from the rest of your application logic, promoting a clean separation of concerns and making your codebase more maintainable and testable.

2)Abstraction Layer: The NetworkRepository acts as an abstraction layer over the NetworkService. This abstraction simplifies making network requests and handling responses, allowing you to focus on higher-level application logic.

3)Dependency Injection: You can inject different implementations of the NetworkService into the NetworkRepository. This flexibility allows you to switch between network service implementations (e.g., for testing or using different APIs) without modifying the repository or higher-level code.

4)Mocking for Testing: With a protocol-based approach, creating mock implementations of the NetworkService for unit testing becomes easy. This guarantees that your tests are isolated from actual network requests, making them more reliable and predictable.

5)Error Handling: The NetworkRepository can centralize error handling logic, making it easier to manage and respond to network-related errors consistently throughout your app.

How to use:

 let service = MagicNetworkService()
 let networkRepository = MagicNetworkGateway(networkService: service)
  Task {
    let items = try await networkRepository.fetchItems()
  }
--------------------------------- Custom service (DI)
let customNetworkService = CustomNetworkService(apiEndpoint: "https://customapi.example.com")
 let networkRepository = MagicNetworkGateway(networkService: customNetworkService)
 let events = try networkRepository.fetchEvents()
