//
//  ContentView.swift
//  TodoListWithFirebase
//
//  Created by Leonardo Serrano on 22/07/23.
//

import SwiftUI

struct ContentView: View {
    @State
    private var reminders = Reminder.samples
    
    @State
    private var isAddReminderDialogPresented = false
    
    private func presentAddReminderView(){
        isAddReminderDialogPresented.toggle()
    }
    
    
    var body: some View {
        List($reminders) { $reminder in
            
            HStack {
                Image(systemName: reminder.isCompleted ? "largecircle.fill.circle": "circle")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        reminder.isCompleted.toggle()
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
                reminder in reminders.append(reminder)
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
             ContentView()
               .navigationTitle("Reminders")
           }
    }
}
