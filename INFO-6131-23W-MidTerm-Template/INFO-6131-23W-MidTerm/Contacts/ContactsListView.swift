import SwiftUI

struct ContactsListView: View {
    /// ViewModel for ContactsListView
    @ObservedObject var viewModel: ContactsListViewModel
    
    /// Main body
    var body: some View {
        // Add Navigation view
        NavigationView {
            // Create list
            List {
                ForEach(viewModel.listData) { contact in
                    // Custom view: ContactRow, acts as a cell/row
                    ContactRow(contact: contact)
                }
                // This is enabled EditButton,allows you to move rows
                .onMove(perform: moveContacts)
                .onDelete(perform: deleteContacts)
                // Horizontal stack to display total sandiwches count
                HStack {
                    Spacer()
                    Text(viewModel.displayCount)
                        .foregroundColor(.gray)
 
                    Spacer()
                }
            }
            .navigationTitle(viewModel.displayNavTitle)
            // To Add search capability
            .searchable(text: $viewModel.searchTerm,
                        placement: .navigationBarDrawer(displayMode: .automatic),
                        prompt: "Search for contactes")
            .onChange(of: viewModel.searchTerm, perform: { newValue in
                viewModel.filterSearchResults()
            })
            .animation(.default, value: viewModel.searchTerm)
            // Toolbar: Add and Edit
            .toolbar {
                HStack {
                    Button("Add", action: makeContact)
                    Spacer()
                    EditButton()
                    Button("Reset", action: resetData)
                }
            }
        }
    }
    
    func resetData() {
        
        viewModel.resetData()
    }
    
    /// To Add new contact
    func makeContact() {
        
        withAnimation {
            guard let randomContact = viewModel.store.contacts.randomElement() else {
                return
            }
            viewModel.makeContact(contact: randomContact)
        }
    }
    
    /// To change ordering of sandiwch
    /// - Parameters:
    ///   - from: Indexset
    ///   - to: Int
    func moveContacts(from: IndexSet, to: Int) {
        
        withAnimation {
            viewModel.moveContacts(from: from, to: to)
        }
    }
    
    /// To remove contact at specified Index
    /// - Parameter offsets: IndexSet
    func deleteContacts(offsets: IndexSet) {
        
        withAnimation {
            viewModel.deleteContacts(offsets: offsets)
        }
    }
}

/// To Add preview to canvas
struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView(viewModel: ContactsListViewModel())
    }
}
