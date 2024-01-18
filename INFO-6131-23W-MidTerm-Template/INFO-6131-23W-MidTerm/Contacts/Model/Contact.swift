import Foundation
struct Contact: Identifiable {
    var id = UUID()
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    let address: String
    let city: String
    let country: String
    let isFavorite: Bool
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var fullAddress: String {
        return "\(address), \(city), \(country)"
    }
    
    init(id: UUID = UUID(), firstName: String, lastName: String, phone: String, email: String, address: String, city: String,country: String, isFavorite: Bool) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.email = email
        self.address = address
        self.city = city
        self.country = country
        self.isFavorite = isFavorite
    }
}
