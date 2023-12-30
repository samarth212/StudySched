//
//  NewConflictTutorial.swift
//  StudySched
//
//  Created by SamSan on 12/30/23.
//

import SwiftUI

struct NewConflictTutorial: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea()
            VStack{
                Text("To add a new conflict, simply enter the name of the conflict followed by the time it will occur.").padding(.bottom)
                Text("This way, whenever you try to add an assignment that matches with this conflict, you will be notified. If you want to avoid this, you can either delete the conflict in the conflicts tab or add the assignment before you add the conflict.")
                
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
}//NewConflictTutorial

#Preview {
    NewConflictTutorial()
}
