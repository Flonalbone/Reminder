//
//  DetailesView.swift
//  Reminder
//
//  Created by Floriana Nalbone on 20/11/23.
//

import SwiftUI

struct DetailesView: View {
    
    
    @State var dateTime: Date = .now
    @State private var dataToggleOn = false
    @State private var timeToggleOn = false
    @State private var positionToggleOn = false
    @State private var messagingToggleOn = false
    @State private var flagToggleOn = false
    @State private var isAddImageOpen = false
    @State private var URL: String = ""
    @State private var selectedOption = 0
    @State private var pickerOptions = ["None", "Low", "Medium", "High"]
    
    
    
//    @State private var
    
    
    var body: some View {
        NavigationStack {
            
            List {
                
                Section{
                    
                    HStack{
                        
                        ZStack {
                            Rectangle ()
                                .frame(width: 30, height: 30)
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.red)
                            
                            Image(systemName: "calendar")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(Color.white)
                        }
                        
                        Toggle("Date", isOn: $dataToggleOn)
                        
                    }
                    
                    
                    HStack {
                        
                        ZStack {
                            Rectangle ()
                                .frame(width: 30, height: 30)
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            
                            Image(systemName: "clock.fill")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(Color.white)
                        }
                        
                        
                        Toggle("Time", isOn: $timeToggleOn)
                        
                        
                    }
                    
                }//fine sezione 1
                
                Section {
                    
                    NavigationLink {
                    } label: {
                        
                        ZStack {
                            Rectangle ()
                                .frame(width: 30, height: 30)
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.gray)
                            
                            Image(systemName: "number")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(Color.white)
                        }
                        
                        Text("Tag")
                        
                    }
                    
                    
                }//fine sezione 2
                
                Section{
                    HStack{
                        
                        ZStack {
                            Rectangle ()
                                .frame(width: 30, height: 30)
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.blue)
                            
                            Image(systemName: "paperplane.fill")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(Color.white)
                        }
                        
                        Toggle("Location", isOn: $positionToggleOn)
                        
                    }
                    
                    
                }//fine sezione 3
                
                Section{
                    HStack{
                        
                        ZStack {
                            Rectangle ()
                                .frame(width: 30, height: 30)
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.green)
                            
                            Image(systemName: "message.fill")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(Color.white)
                        }
                        
                        Toggle("When messaging", isOn: $messagingToggleOn)
                        
                    }
                    
                }footer: {
                    Text("Selecting this option will show the reminder notification when chatting with a person in Messages.")
                        .foregroundColor(.gray)
                        .font(.caption)
                        .padding(.top, -5)
                        .padding(.trailing, 20)
                        .listRowBackground(Color.clear)
                    
                }//fine sezione 4
                
                Section{
                    HStack{
                        
                        ZStack {
                            Rectangle ()
                                .frame(width: 30, height: 30)
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.orange)
                            
                            Image(systemName: "flag.fill")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(Color.white)
                        }
                        
                        Toggle("Flag", isOn: $flagToggleOn)
                        
                    }
                    
                }
                
                
                //fine sezione 5
                
                Section {
                    
                    // Picker for selecting an option
                    HStack {
                        
                        ZStack {
                            Rectangle ()
                                .frame(width: 30, height: 30)
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.red)
                            
                            Image(systemName: "exclamationmark")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(Color.white)
                        }
                        
                        Picker("Priority", selection: $selectedOption) {
                            ForEach(0..<pickerOptions.count) { index in
                                Text(pickerOptions[index])
                            }
                        }
                    }
                    
                }//fine sezione 5
                
                //Add image
                Section {
                    Text("Add Image")
                        .foregroundColor(Color.blue)
                }
                
                
                Section {
                    TextField("URL", text: $URL)
                }

                //URL
                
                
            }.listSectionSpacing(15.0)
            
            
        }
        //fine navigationStack
    }
}

#Preview {
    DetailesView()
}


