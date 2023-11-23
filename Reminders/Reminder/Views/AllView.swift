//
//  allView.swift
//  Reminder
//
//  Created by Floriana Nalbone on 17/11/23.
//

import Foundation
import SwiftUI

struct AllView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var reminders : [Reminder]
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
            
                Text("Reminders")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundStyle(Color.blue)
                    .padding(.trailing, 220)
                
                Spacer()
                
                //Cerchio selezionabile
                
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Add your "Back to List" functionality here
                        presentationMode.wrappedValue.dismiss()
                    },
                           label: {
                        Image(systemName: "chevron.left")
                            .bold()
                        Text("Lists")
                    })
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Button(action: {
                            print("Option 1 selected")
                        }) {
                            Label("Select Reminders", systemImage: "checkmark.circle")
                        }

                        Button(action: {
                            print("Option 2 selected")
                        }) {
                            Label("Show Completed", systemImage: "eye")
                        }
                        Button(action: {
                            print("Option 3 selected")
                        }) {
                            Label("Print", systemImage: "printer")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
//
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("All")
            
        }
        
    }
}


#Preview {
    AllView(reminders: .constant([]))
}
