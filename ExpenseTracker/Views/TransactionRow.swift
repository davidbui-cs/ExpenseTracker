//
//  ExpenseRow.swift
//  ExpenseTracker
//
//  Created by David Bui on 12/29/22.
//

import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction

    var body: some View {
        HStack(spacing: 0) {
            if let expense = transaction as? Expense {
                ExpenseCategoryRow(category: expense.category)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else if let income = transaction as? Income {
                IncomeCategoryRow(category: income.category)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            Text(transaction.name)
            Text("$\(transaction.amount, specifier: "%.2f")")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: Expense(id: UUID(), name: "Sample Expense", amount: 25.99, date: Date(), category: .home))
    }
}
