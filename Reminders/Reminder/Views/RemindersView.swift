//
//  RemindersView.swift
//  Reminder
//
//  Created by Floriana Nalbone on 15/11/23.
//

import SwiftUI

struct RemindersView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var reminders: [Reminder]
    @State private var isModalPresented = false
    
//    init() {
//            UINavigationBar.appearance().largeTitleTextAttributes = [
//                .foregroundColor: UIColor.init(Color(.blue))
//            ]
//    
//        }
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading) {
                    
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        isModalPresented.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                        Text("New Reminder")
                    })
                    .sheet(isPresented: $isModalPresented, content: {
                        // Content of the modal view
                        ModalView(reminders: $reminders)
                    })
                }.padding(.trailing, 200)
                
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
                    Button(action: {
                        // Add your share functionality here
                        print("Share button tapped")
                    }) {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Button(action: {
                            print("Option 1 selected")
                        }) {
                            Label("View as Columns", systemImage: "list.bullet.below.rectangle")
                        }
                        
                        Divider()
                        
                        Button(action: {
                            print("Option 2 selected")
                        }) {
                            Label("Show List Info", systemImage: "info.circle")
                        }
                        
                        Button(action: {
                            print("Option 3 selected")
                        }) {
                            Label("Select Reminders", systemImage: "checkmark.circle")
                        }
                        
                        Button(action: {
                            print("Option 4 selected")
                        }) {
                            Label("New Section", systemImage: "list.bullet.below.rectangle")
                        }
                        
                        Button(action: {
                            print("Option 5 selected")
                        }) {
                            Label("Sort By", systemImage: "arrow.up.arrow.down")
                        }
                        
                        Button(action: {
                            print("Option 6 selected")
                        }) {
                            Label("Show Completed", systemImage: "eye")
                        }
                        
                        Button(action: {
                            print("Option 7 selected")
                        }) {
                            Label("Save As Template", systemImage: "plus.square.on.square")
                        }
                        
                        Button(action: {
                            print("Option 8 selected")
                        }) {
                            Label("Print", systemImage: "printer")
                        }
                        
                        Button(action: {
                            print("Option 9 selected")
                        }) {
                            Label("Delete List", systemImage: "trash")
                        }
                        
                    } label: {
                        Image(systemName: "ellipsis.circle")
                        
                    }
                    
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Title")
        }
    }
}

#Preview {
    RemindersView(reminders: .constant([Reminder(title: "", note: "")]))
}
