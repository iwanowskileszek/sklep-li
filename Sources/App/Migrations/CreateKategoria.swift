import Fluent

struct CreateKategoria: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("kategoria")
            .id()
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("kategoria").delete()
    }
}

