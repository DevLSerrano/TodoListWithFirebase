//
//  ContentView.swift
//  TodoListWithFirebase
//
//  Created by Leonardo Serrano on 22/07/23.
//

import SwiftUI

struct RemindersListView: View {
    
    @StateObject
    private var viewModel = RemindersListViewModel()
    
    @State
    private var isAddReminderDialogPresented = false
    
    private func presentAddReminderView(){
        isAddReminderDialogPresented.toggle()
    }
    
    
    var body: some View {
        List($viewModel.reminders) { $reminder in
            
            HStack {
                Image(systemName: reminder.isCompleted ? "largecircle.fill.circle": "circle")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        viewModel.toggleCompleted(reminder)
                    }
                Text(reminder.title)
                Spacer()
                Image(systemName: "trash")
                    .onTapGesture {
                        
                    }
                
            }
            
        }
        .toolbar{
            ToolbarItemGroup(placement: .bottomBar){
                Button(action: presentAddReminderView){
                    HStack{
                        Image(systemName: "plus.cicle.fill")
                        Text("New Reminder")
                    }
                }
                Spacer()
            }
        }
        .sheet(isPresented: $isAddReminderDialogPresented){
            AddReminderView{
                reminder in viewModel.addReminder(reminder)
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RemindersListView()
                .navigationTitle("Reminders")
        }
    }
}