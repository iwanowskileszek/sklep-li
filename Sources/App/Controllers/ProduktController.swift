import Fluent
import Vapor

struct ProduktController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let produkty = routes.grouped("produkt")
        produkty.get(use: index)
        produkty.post(use: create)
        produkty.group(":produktID") { produkt in
            produkt.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Produkt]> {
        return Produkt.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Produkt> {
        let produkt = try req.content.decode(Produkt.self)
        return produkt.save(on: req.db).map { produkt }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Produkt.find(req.parameters.get("produktID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
