//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by David Bui on 1/7/23.
//

import Foundation

class TransactionModel: ObservableObject {
    @Published var transactions: [Transaction]

    init(transactions: [Transaction] = []) {
        self.transactions = transactions
    }

    func createTransaction(name: String, amount: Double, date: Date, category: String, type: TransactionType) -> Transaction? {
        switch type {
        case .expense:
            return Expense(id: UUID(), name: name, amount: amount, date: date, category: ExpenseCategory(rawValue: category)!)
        case .income:
            return Income(id: UUID(), name: name, amount: amount, date: date, category: IncomeCategory(rawValue: category)!)
        }
    }

    func addTransaction(transaction: Transaction) {
        self.transactions.append(transaction)
    }

    func deleteTransaction(at index: Int) {
        self.transactions.remove(at: index)
    }
}
