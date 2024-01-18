import Foundation

final class ContactStore : ObservableObject {
    @Published var contacts: [Contact]
    
    init(contacts: [Contact] = intialData) {
        self.contacts = contacts
    }
}

extension ContactStore {
    static var intialData = [
        Contact(firstName: "Tom",
                lastName: "Brady",
                phone: "(416)123-4567",
                email: "tom.brady@gmail.com",
                address: "588 Riviera Drive",
                city: "Tampa Bay",
                country: "US",
                isFavorite: true),
        Contact(firstName: "Payton",
                lastName: "Manning",
                phone: "(647)123-4567",
                email: "manning@gmail.com",
                address: "55 Haverstock Cr.",
                city: "Georgetown",
                country: "Canada",
                isFavorite: false),
        Contact(firstName: "John",
                lastName: "Doe",
                phone: "(905)123-4567",
                email: "john@gmail.com",
                address: "55 Bristol Dr.",
                city: "Caledon",
                country: "Canada",
                isFavorite: false),
        Contact(firstName: "Brett",
                lastName: "Let",
                phone: "(416)123-4567",
                email: "dv@gmail.com",
                address: "69 Wellington St. West",
                city: "Toronto",
                country: "CAN",
                isFavorite: true),
        Contact(firstName: "Virat",
                lastName: "Kohli",
                phone: "(647)123-4567",
                email: "manning@gmail.com",
                address: "20 Fishing Cr.",
                city: "Brampton",
                country: "Canada",
                isFavorite: true),
        Contact(firstName: "Rohit",
                lastName: "Sharma",
                phone: "(647)123-4567",
                email: "sharma@gmail.com",
                address: "22 Fishing Cr.",
                city: "Brampton",
                country: "Canada",
                isFavorite: false),
    ]
    
    static var testContactStore: ContactStore = ContactStore(contacts: intialData)
}
