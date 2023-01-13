//
//  ExpenseList.swift
//  ExpenseTracker
//
//  Created by David Bui on 12/28/22.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionModel: TransactionModel

    var body: some View {
        List {
            ForEach(transactionModel.transactions, id: \.id) { transaction in
                TransactionRow(transaction: transaction)
            }
        }
        .navigationBarTitle("Transactions")
        .navigationBarItems(trailing:
            NavigationLink(destination: NewTransaction()) {
                Image(systemName: "plus")
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
            }
        )
    }
}

struct TransactionList_Previews: PreviewProvider {
    static var previews: some View {
        TransactionList()
            .environmentObject(TransactionModel())
    }
}
