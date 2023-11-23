//
//  todayView.swift
//  Reminder
//
//  Created by Floriana Nalbone on 17/11/23.
//

import SwiftUI

struct Reminder: Identifiable {
    var id = UUID()
    var title: String = ""
    var note: String = ""
}


struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var reminders: [Reminder]
    @State var title: String = ""
    @State var note: String = ""
    @State private var isDetailesPresented = false
    
    
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Title", text: $title)

                    
                    ZStack(alignment: .leading) {
                        if note.isEmpty {
                            Text("Note")
                                .padding(.bottom, 70)
                                .foregroundColor(.gray).opacity(0.6)
                                .padding([.leading, .bottom], 5)
                        }
                        TextEditor(text: $note)
                    }
                    .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        if title.isEmpty {
                            
                        }
                    }
                    .frame(minHeight: 100)
                    .padding(.leading, -4)
                }.accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
                Section {
                    NavigationLink(destination: DetailesView()) {
                        Text("Detailes")
                    }
                }
                
                
                Section{
                    NavigationLink {
                    } label: {
                        Image(systemName: "list.bullet.circle.fill")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(Color.red)
                        
                        Text("List")
                        
                    }
                    
                }
                
                
                
            }.listSectionSpacing(15.0)
                .navigationBarTitle("New Reminder", displayMode: .inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        HStack(alignment: .center) {
                            
                            Button("Cancel") {
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                        
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add") {
                            let newReminder = Reminder(title: title, note: note)
                            reminders.append(newReminder)
                            print(reminders.count)

                            presentationMode.wrappedValue.dismiss()
                        
                        }
                    }
                    
                    
                    
                    
                    
                }.background(Color.gray)
            
            
        }
    }
}
  
#Preview {
    ModalView(reminders: .constant([Reminder(title: "", note: "")])
    )}
