import Fluent
import Vapor

final class Kategoria: Model, Content {
    static let schema = "kategoria"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String
    
    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
