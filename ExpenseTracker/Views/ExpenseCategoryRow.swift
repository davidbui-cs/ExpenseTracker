//
//  SwiftUIView.swift
//  ExpenseTracker
//
//  Created by David Bui on 12/30/22.
//

import SwiftUI

struct ExpenseCategoryRow: View {
    var category: ExpenseCategory

    var body: some View {
        HStack {
            Image(systemName: category.symbolName)
            Text(category.rawValue.capitalized)
        }
    }
}
struct ExpenseCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCategoryRow(category: .children)
    }
}
