//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Maryam Mohsen on 23/08/2024.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
          
        }
    }
}
