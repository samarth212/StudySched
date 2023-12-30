//
//  AssignmentsTutorial.swift
//  StudySched
//
//  Created by SamSan on 12/30/23.
//

import SwiftUI

struct AssignmentsTutorial: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack{
                Text("This is the assignments page, where you can see and manage all the the assignments that you have currently added. By clicking the i, you can see the detailed view of the assignment. If you swipe on an assignment, you can delete it.").padding(.bottom)
                Text("You can also edit one time assignments and make any necessary changes. For example, when an assignment's due date has passed, a pop up will show and if you click on extend due date, it will take you to this page.")
                
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
}//AssignmentsTutorial

#Preview {
    AssignmentsTutorial()
}
