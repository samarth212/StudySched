//
//  ConflictsTutorial.swift
//  StudySched
//
//  Created by SamSan on 12/30/23.
//

import SwiftUI

struct ConflictsTutorial: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea()
            VStack{
                Text("This is the conflicts page, where you can see and manage your conflicts.").padding(.bottom)
                Text("To delete conflicts, you can swipe on a conflict.")
                
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
}//ConflictsTutorial

#Preview {
    ConflictsTutorial()
}
