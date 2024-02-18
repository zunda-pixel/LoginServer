import OpenAPIRuntime
import OpenAPIVapor
import Vapor

struct Handler: APIProtocol {
  func login(_ input: Operations.login.Input) async throws -> Operations.login.Output {
    return .seeOther(.init(headers: .init(location: "https://apple.com")))
  }
}

@main struct LoginServer {
  static func main() async throws {
    let app = Vapor.Application()
    let transport = VaporTransport(routesBuilder: app)
    let handler = Handler()
    try handler.registerHandlers(on: transport)
    try await app.execute()
  }
}
