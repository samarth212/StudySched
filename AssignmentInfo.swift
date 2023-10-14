//
//  AssignmentInfo.swift
//  TM_Demo
//
//  Created by SamSan on 9/15/23.
//

import SwiftUI


struct AssignmentInfo: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data: MyData
    
   
   
    
    var body: some View {
        
        //zstack main view
        ZStack{
            
            Color.blue.ignoresSafeArea()
            
            //INFO
            VStack(alignment: .leading, spacing:12){
                
                ScrollView{
                    Text("Assignment Name: \(data.infoData[0])")
                    
                }
                
                
                ScrollView{
                    Text("Description: \(data.infoData[1])")
                }
                
                Text("Difficulty Level: \(data.infoData[2])")
                Text("Assignment Type: \(data.infoData[3])")
                Text("Start Date: \(data.infoData[4])")
                Text("End/Due Date: \(data.infoData[5])")
                Text("Weekend Staus: \(data.infoData[6])")
                
                
                
            }//vstack
            .font(.title3)
            .padding(.top)
            .padding(.leading)
            .fontWeight(.medium)
            .foregroundColor(.white)
            
            
            //X BUTTON
            VStack{
                
                HStack{
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.black)
                            .font(.title)
                    }//button

                    
                    
                }//hstack
                .padding()
                
                
                Spacer()
                
                
            }//x button vstack
            
        }//zstack
        
        
        
        
        
    }//body
    
    
    
}//AssignmentInfo

struct AssignmentInfo_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentInfo().environmentObject(MyData())
    }
}
