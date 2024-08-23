//
//  ListRowView.swift
//  ToDoList
//
//  Created by Maryam Mohsen on 23/08/2024.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName:item.isCompleted ? "checkmark.circle": "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

#Preview {
     var item1 = ItemModel(title: "Go Shopping",isCompleted: false)
     var item2 = ItemModel(title: "Go Shopping",isCompleted: true)
    return Group{
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
    .previewLayout(.sizeThatFits)
}
