//
//  AddView.swift
//  ToDoList
//
//  Created by Maryam Mohsen on 23/08/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type Something here: ",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(Color(red: 0.9, green: 0.9, blue: 0.9))

                .clipShape(RoundedRectangle(cornerRadius: 10))
                Button(action:saveButtonPressed, label:{
                    Text("Save".uppercased())
                        .foregroundStyle(Color(.white))
                        .font(.headline)
                        .frame(height:60)
                        .frame(maxWidth:.infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }
            .padding(13)
        }
        .navigationTitle("Add an Item ✏️")
        .alert(isPresented: $showAlert, content:getAlert)
    }
    func saveButtonPressed(){
        if textIsValid(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle="Must be at least 3 characters long 🦦"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}
