//
//  RecurringSheet.swift
//  TM_Demo
//
//  Created by SamSan on 10/1/23.
//

import SwiftUI

struct RecurringSheet: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var data = MyData()
    @State private var allowDone: Bool = false
    
    var body: some View {
        
        //zstack main
        ZStack{
            VStack{
                
                
                
                List($data.recurringDays){ $day in
                    
                    HStack{
                        
                        Image(systemName: day.isChecked ? "checkmark.circle.fill": "circle")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .onTapGesture{
                                day.isChecked.toggle()
                                
                            }//tap
                        
                        Text(day.name)
                        
                        
                        
                    }//hstack
                    
                        
                    
                    
                }//list of days
                
                VStack{
                    
                    //Start time prompt
                    DatePicker("Starting Time:", selection: $data.rTimeStart, displayedComponents: [.hourAndMinute])
                        .font(.title2)
                    //End time prompt
                    DatePicker("End Time:", selection: $data.rTimeEnd, displayedComponents: [.hourAndMinute])
                        .font(.title2)
                    
                    //Start date prompt
                    DatePicker("Start Date:", selection: $data.rStart, displayedComponents: [.date])
                        .font(.title2)
                        
                    //End date prompt
                    DatePicker("End Date:", selection: $data.rEnd, displayedComponents: [.date])
                        .font(.title2)
                  
                    
                }//dates
                .padding(.horizontal)
                .padding(.bottom, 30)
                
                
                
                //DONE BUTTON RECURRING
                Button {
                    
                    
                    for day in data.recurringDays {
                        if day.isChecked {
                            //data.rDays.append(day.name)
                        }//if its true
                        else{
                            if data.rDays.contains(day.name){
                                data.rDays.removeAll{$0 == day.name}
                            }//if false placement
                        }//if isnt
                    }//loop
                    
                    dismiss()
                    
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 80, height: 40)
                            .cornerRadius(10)
                        Text("Done")
                            .foregroundColor(.white)
                            .font(.title3)
                        
                    }//zstack
                }//button

                
            }//vstack
           
            
        
            //X BUTTON RECURRING
            VStack{
                
                HStack{
                    Spacer()
                    Button {
                        data.eventRecurring.toggle()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                        
                    }//button

                    
                }//hstack
                .padding(.horizontal)
                
                Spacer()
            }//x button
            .padding(.top)
            
            
        }//zstack
        
        
        
        
        
        
        
        
        
        
        
    }//body
}//RecurringSheet

struct RecurringSheet_Previews: PreviewProvider {
    static var previews: some View {
        RecurringSheet()
    }
}
