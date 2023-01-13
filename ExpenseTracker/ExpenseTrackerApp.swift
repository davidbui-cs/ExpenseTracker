//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by David Bui on 12/28/22.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionModel = TransactionModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionModel)
        }
    }
}
