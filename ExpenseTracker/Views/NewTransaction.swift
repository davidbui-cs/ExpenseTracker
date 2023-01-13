//
//  NewTransaction.swift
//  ExpenseTracker
//
//  Created by David Bui on 12/29/22.
//

import SwiftUI

struct NewTransaction: View {
    @EnvironmentObject var transactionModel: TransactionModel
    @State private var name: String = ""
    @State private var amount: String = ""
    @State private var date: Date = .init()
    @State private var category: String = ""
    @State private var typeIndex: Int = 0

    var type: TransactionType {
        switch typeIndex {
        case 0:
            return .expense
        case 1:
            return .income
        default:
            return .expense
        }
    }
    
    var isFormValid: Bool {
        return !name.isEmpty && !amount.isEmpty && date != .init() && !category.isEmpty
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Type", selection: $typeIndex, content: {
                        Text("Expense").tag(0)
                        Text("Income").tag(1)
                    }).pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    TextField("Transaction name", text: $name)
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    
                    Picker("Category", selection: $category, content: {
                        if type == .expense {
                            ForEach(ExpenseCategory.allCases, id: \.self) { category in
                                ExpenseCategoryRow(category: category).tag(category.rawValue)
                            }
                        } else {
                            ForEach(IncomeCategory.allCases, id: \.self) { category in
                                IncomeCategoryRow(category: category).tag(category.rawValue)
                            }
                        }
                    })
                }
                Section {
                    Button(action: {
                        let newTransaction = transactionModel.createTransaction(name: name, amount: Double(amount) ?? 0, date: date, category: category, type: type)
                        if let newTransaction = newTransaction {
                            transactionModel.addTransaction(transaction: newTransaction)
                            self.navigation.pop()
                        }
                        
                    }) {
                        Text("Save")
                    }.disabled(!isFormValid)
                }
            }
        }
    }
}

struct NewTransaction_Previews: PreviewProvider {
    static var previews: some View {
        NewTransaction()
    }
}
