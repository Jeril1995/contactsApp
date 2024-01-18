//
//  INFO_6131_23W_MidTermApp.swift
//  INFO-6131-23W-MidTerm
//
//  Created by DV Punia on 2023-02-05.
//

import SwiftUI

@main
struct INFO_6131_23W_MidTermApp: App {
    @StateObject private var store = ContactStore.testContactStore
    var body: some Scene {
        WindowGroup {
            ContactsListView(viewModel: ContactsListViewModel())
        }
    }
}
