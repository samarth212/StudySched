//
//  NewAssignmentTutorial.swift
//  StudySched
//
//  Created by SamSan on 12/30/23.
//

import SwiftUI

struct NewAssignmentTutorial: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack{
                Text("To add a new assignment, first select whether it is a one time event or a recurring event. If it is recurring, a pop up will show up, where you can choose the days and times it occurs over!").padding(.bottom)
                Text("Then, you can type in the name and description of the event. You can choose the difficulty of the assignment as well as the type of assignment it is. You can also choose if you want to work on this assignment on the weekend.")
                
            }//vstack for text
            .foregroundStyle(.white)
            .font(.title3)
            .padding()
            
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                    })
                    
                }//hstack for x button
                
                Spacer()
                
            }//vstack for x button
            .foregroundStyle(.black)
            .font(.title)
            .padding()
            
            
            
        }//zstack main
    }//body
        
}//NewAssignmentTutorial

#Preview {
    NewAssignmentTutorial()
}
