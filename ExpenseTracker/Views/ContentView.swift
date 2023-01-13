//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by David Bui on 12/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TransactionList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TransactionModel())
    }
}
