import Fluent

struct CreateProdukt: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("produkt")
            .id()
            .field("title", .string, .required)
            .field("description", .string, .required)
            .field("image", .string, .required)
            .field("quantity", .int, .required)
            .field("kategoria_id", .uuid, .required)
            .foreignKey("kategoria_id", references: Kategoria.schema, .id, onDelete: .cascade, onUpdate: .noAction)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("produkt").delete()
    }
}
