//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Maryam Yousif on 23/08/2024.
//

import Foundation

/*
 CRUD FUNCTIONS
 create, read, update, delete
 */
class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title:"This is the first title",isCompleted:false),
            ItemModel(title:"This is the Second title",isCompleted:true),
            ItemModel(title:"This is the Third title",isCompleted:false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from:IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        //get the index of the item in the items array
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index]=item.updateCompletion()
        }
    }
}
