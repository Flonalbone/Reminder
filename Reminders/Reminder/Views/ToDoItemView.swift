//
//  ToDoItemView.swift
//  Reminder
//
//  Created by Floriana Nalbone on 22/11/23.
//

import SwiftUI

struct ToDoItemView: View {
    @State private var isDone = false
    @State var title: String
    @State var note: String
    
    
    var body: some View {
        
        HStack {
            Button {
                withAnimation {
                    isDone.toggle()
                }
            } label: {
                Image (systemName: isDone ? "circle.inset.filled" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(isDone ? .blue : .gray)
                    .sensoryFeedback(.success, trigger: isDone)
            }
            HStack {
                VStack(alignment: .leading){
                    Text(title)
                    Text(note)
                        .font(.caption2)
                        .foregroundStyle(.gray).opacity(0.8)
               }
            }
        }.padding(1.5)
    }
}

#Preview {
    ToDoItemView(title: "", note: "")
}
