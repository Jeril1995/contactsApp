import SwiftUI

struct ContactDetail: View {
    @State private var zoomed = false
    var contact: Contact
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
                
                Text(contact.fullName)
                    .font(.largeTitle)
                            
                if contact.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.largeTitle)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                
                Spacer()
            }
            
            ContactInfoRow(label: "Phone", value: contact.phone)
            ContactInfoRow(label: "Email", value: contact.email)
            ContactInfoRow(label: "Address", value: contact.fullAddress)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Contact Details")
    }
}

struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ContactDetail(contact: ContactStore.testContactStore.contacts[0])
            }
            NavigationView {
                ContactDetail(contact: ContactStore.testContactStore.contacts[1]  )
            }
        }
    }
}
