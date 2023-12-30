//
//  EditTutorial.swift
//  StudySched
//
//  Created by SamSan on 12/30/23.
//

import SwiftUI

struct EditTutorial: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack{
                Text("Here, you can edit the features of an assignment. For parts that you want to keep the same, you can just leave that field blank.").padding(.bottom)
             
                
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
}//EditTutorial

#Preview {
    EditTutorial()
}
