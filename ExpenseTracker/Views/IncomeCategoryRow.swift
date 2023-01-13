//
//  IncomeCategoryRow.swift
//  ExpenseTracker
//
//  Created by David Bui on 1/2/23.
//

import SwiftUI

struct IncomeCategoryRow: View {
    var category: IncomeCategory

    var body: some View {
        HStack {
            Image(systemName: category.symbolName)
            Text(category.rawValue.capitalized)
        }
    }
}
struct IncomeCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        IncomeCategoryRow(category: .bonus)
    }
}
