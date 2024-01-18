//
//  ContactInfoRow.swift
//  INFO-6131-23W-MidTerm
//
//  Created by Jeril Johnson Nedumbakaran on 2023-06-16.
//

import SwiftUI

struct ContactInfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.black)
            
            Spacer()
            
            Text(value)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 5)
    }
}

struct ContactInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfoRow(label: "Phone", value: "(123) 456-7890")
    }
}
