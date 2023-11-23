//
//  HomeScreen.swift
//  Reminder
//
//  Created by Floriana Nalbone on 14/11/23.
//

import SwiftUI


struct card: View {
    
    @Binding var reminders : [Reminder]
    @State var title: String
    @State var color: Color
    @State var symbol: String
    @State var numberOfReminders: Int
    
    var body: some View {
        
        ZStack (alignment: .leading){
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: symbol)
                        .resizable()
                        .fontWeight(.bold)
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(color)
                    
                    Spacer(minLength: 95)
                    
                    
                    Text("\(reminders.count)")
                        .font(.title)
                        .bold()
                        .fontDesign(.rounded)
                        .foregroundStyle(Color.black)
                    Spacer()
                }
                Text(title)
                    .font(.headline)
                    .foregroundStyle(Color.gray)
                    .textCase(nil)
                
            }.padding(.leading)
            
        }.frame(width: 170, height: 75)
            .background()
            .cornerRadius(12)
    }
}


struct HomeScreen: View {
    
    
    @State var lists: [String] = ["Reminders"]
    @State var reminders : [Reminder] = []
    @State var search: String = ""
    @State private var isModalPresented = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                ZStack{
                    Color.gray
                        .ignoresSafeArea()
                        .opacity(0.1)
                    
                    
                    VStack{
                        
                        List{
                            
                            Section {
                                ForEach(lists, id: \.self) { list in
                                    NavigationLink(destination: RemindersView(reminders: $reminders)){
                                        
                                        HStack{
                                            ZStack{
                                                Circle ()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width:30)
                                                    .foregroundColor(.blue)
                                                Image(systemName: "list.bullet")
                                                    .fontWeight(.bold)
                                                    .foregroundStyle(Color.white)
                                            }
                                            .padding(.leading, -10)
                                            .padding(.trailing, 5)
                                            Text(list)
                                        }
                                    }
                                }
                            }
                            
                        header: {
                            VStack (alignment: .leading) {
                                HStack{
                                    VStack{
                                        
                                        card(reminders: .constant([]), title: "Today", color: .blue, symbol: "calendar.circle.fill", numberOfReminders: 0)
                                            .padding(.bottom,10)
                                        
                                        NavigationLink(destination: AllView( reminders: $reminders)) {
                                            card(reminders: $reminders, title: "All", color: .black, symbol: "tray.circle.fill", numberOfReminders: 0)
                                                .padding(.bottom,10)
                                        }
                                        
                                        card(reminders: .constant([]), title: "Completed", color: .gray, symbol: "checkmark.circle.fill", numberOfReminders: 0)
                                        
                                    }.padding(.trailing, 10)
                                    
                                    VStack {
                                        card(reminders: .constant([]), title: "Scheduled", color: .red, symbol: "calendar.circle.fill", numberOfReminders: 0)
                                            .padding(.bottom,10)
                                        
                                        card(reminders: .constant([]), title: "Flagged", color: .orange, symbol: "flag.circle.fill", numberOfReminders: 0)
                                            .padding(.bottom,10)
                                        
                                        card(reminders: .constant([]), title: "Assigned", color: .green, symbol: "person.circle.fill", numberOfReminders: 0)
                                    }
                                }
                                Text("My Lists").textCase(nil)
                                    .font(.title2)
                                    .bold()
                                    .fontDesign(.rounded)
                                    .foregroundStyle(.black)
                                    .padding(.vertical, 5)
                                    .padding(.leading, 5)
                                
                                
                            }
                        }
                        }
                        
                        
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
                            
                            Spacer()
                                .frame(width: 150)
                            
                            Button("Add List"){
                                print("\(reminders.count)")
                                lists.append("Name List")
                            }
                            
                        }
                        
                    }
                    
                }
            }.toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Button(action: {
                            print("Option 1 selected")
                        }) {
                            Label("Edit Lists", systemImage: "pencil")
                        }
                        
                        Button(action: {
                            print("Option 2 selected")
                        }) {
                            Label("Templates", systemImage: "square.on.square")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            
        }
        .searchable(text: $search)
        
    }
}


#Preview {
    HomeScreen()
}
