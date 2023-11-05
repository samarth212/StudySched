//
//  RecurringInfo.swift
//  TM_Demo
//
//  Created by SamSan on 10/8/23.
//

import SwiftUI

struct RecurringInfo: View {
    
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data: MyData
    
    
    var body: some View {
        
        ZStack{
            
            Color.blue.ignoresSafeArea()
            
            //INFO
            VStack(alignment: .leading, spacing:12){
                
                ScrollView{
                    Text("Assignment Name: \(data.infoRData[0])")
                    
                }
                
                
                ScrollView{
                    Text("Description: \(data.infoRData[1])")
                }
                
                Text("Start Date: \(data.infoRData[2])")
                Text("End Date: \(data.infoRData[3])")
                
                ScrollView{
                    Text("Every: \(data.infoRData[6])")
                }
                
                Text("From \(data.infoRData[4]) to \(data.infoRData[5])")
                
                Text("Difficulty Level: \(data.infoRData[7])")
                Text("Assignment Type: \(data.infoRData[8])")
                
                
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
                        data.showEndTime = false
                        data.rshowEndTime = false
                        data.timerOn = true
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
}//Recurring Info

struct RecurringInfo_Previews: PreviewProvider {
    static var previews: some View {
        RecurringInfo().environmentObject(MyData())
    }
}
