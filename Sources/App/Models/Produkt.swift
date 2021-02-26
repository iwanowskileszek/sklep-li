import Fluent
import Vapor

final class Produkt: Model, Content {
    static let schema = "produkt"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String
    
    @Field(key: "description")
    var description: String
    
    @Field(key: "image")
    var image: String
    
    @Field(key: "quantity")
    var quantity: Int
    
    @Parent(key: "kategoria_id")
    var kategoria_id: Kategoria

    init() { }

    init(id: UUID? = nil, title: String, description: String, image: String,
         quantity: Int) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.quantity = quantity
    }
}
