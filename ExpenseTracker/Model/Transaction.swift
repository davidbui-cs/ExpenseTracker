//
//  Transaction.swift
//  ExpenseTracker
//
//  Created by David Bui on 12/29/22.
//

import Foundation

protocol Transaction {
    var id: UUID { get }
    var name: String { get }
    var amount: Double { get }
    var date: Date { get }
}

extension Transaction {
    var category: String {
        switch self {
        case let expense as Expense:
            return expense.category
        case let income as Income:
            return income.category
        default:
            return ""
        }
    }
}

enum ExpenseCategory: String, CaseIterable {
    case housing
    case transportation
    case food
    case health
    case personal
    case education
    case entertainment
    case travel
    case home
    case children
    case pets
    case hobbies
    case other

    var symbolName: String {
        switch self {
        case .housing:
            return "house"
        case .transportation:
            return "car"
        case .food:
            return "tray"
        case .health:
            return "heart"
        case .personal:
            return "person"
        case .education:
            return "book"
        case .entertainment:
            return "ticket"
        case .travel:
            return "airplane"
        case .home:
            return "house"
        case .children:
            return "person.2"
        case .pets:
            return "pawprint"
        case .hobbies:
            return "paintbrush"
        case .other:
            return "ellipsis"
        }
    }
}

enum IncomeCategory: String, CaseIterable {
    case salary
    case bonus
    case commissions
    case dividends
    case interest
    case rental
    case other

    var symbolName: String {
        switch self {
        case .salary:
            return "dollarsign.circle"
        case .bonus:
            return "gift"
        case .commissions:
            return "chart.bar"
        case .dividends:
            return "chart.pie"
        case .interest:
            return "percent"
        case .rental:
            return "house"
        case .other:
            return "ellipsis"
        }
    }
}

struct Expense: Transaction {
    let id: UUID
    let name: String
    let amount: Double
    let date: Date
    let category: ExpenseCategory
}

struct Income: Transaction {
    let id: UUID
    let name: String
    let amount: Double
    let date: Date
    let category: IncomeCategory
}

enum TransactionType {
    case expense
    case income
}
