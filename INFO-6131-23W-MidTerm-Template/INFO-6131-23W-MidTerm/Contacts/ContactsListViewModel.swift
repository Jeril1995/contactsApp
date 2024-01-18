import SwiftUI

/// ViewModel for ContactsListView
final class ContactsListViewModel: ObservableObject {
    //MARK: Observable propreties
    @ObservedObject var store: ContactStore
    @Published var navTitle: String = ""
    @Published var searchTerm: String = ""
    @Published var searchResults: [Contact] = []
    private var intialContacts: [Contact]
    
    /// Computed property to display data
    var listData: [Contact] {
        return searchTerm.isEmpty ? store.contacts : searchResults
    }
    /// Show total count of contactes
    var displayCount: String {
        "\(listData.count) Contacts"
    }
    
    var displayNavTitle: String {
        "\(navTitle) (\(listData.count))"
    }
    
    /// Inititalizer
    /// - Parameters:
    ///   - store: ContactStore
    ///   - navTitle: String
    init(store: ContactStore = ContactStore.testContactStore, navTitle: String = "Contacts") {
        self.store = store
        self.navTitle = navTitle
        self.intialContacts = ContactStore.intialData
    }

    /// To filter result using search
    func filterSearchResults() {
        searchResults = store.contacts.filter({ $0.fullName.localizedCaseInsensitiveContains(searchTerm)})
    }
    
    /// Adds given contact to ContactStore
    /// - Parameter contact: Contact
    func makeContact(contact: Contact) {
        store.contacts.append(contact)
    }
    
    /// Removes contact for ContactStore at given index
    /// - Parameter offsets: Indexset
    func deleteContacts(offsets: IndexSet) {
        store.contacts.remove(atOffsets: offsets)
    }
    
    /// Moves contact in Contact store
    /// - Parameters:
    ///   - from: IndexSet
    ///   - to: Int
    func moveContacts(from: IndexSet, to: Int) {
        store.contacts.move(fromOffsets: from, toOffset: to)
    }
    
    func resetData() {
        store.contacts = intialContacts
    }
}

