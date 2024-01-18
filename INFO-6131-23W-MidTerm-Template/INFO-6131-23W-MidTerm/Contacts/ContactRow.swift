import SwiftUI

/// Resuable Contact Row/Cell
struct ContactRow: View {
    var contact: Contact
    var body: some View {
        // The NavigationLink is the way to navigate to another view.
        // It ONLY works inside of a NavigationView.
        NavigationLink( destination: ContactDetail(contact: contact)) {
            HStack {
                Text(contact.fullName)
                    .font(.headline)
                
                Spacer()
                
                if contact.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            .padding(.vertical, 8)
        } // NavigationLink
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(contact: ContactStore.testContactStore.contacts[0])
    }
}
