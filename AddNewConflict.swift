//
//  SettingsTab.swift
//  TM_Demo
//
//  Created by SamSan on 9/9/23.
//

import SwiftUI

struct AddNewConflict: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data: MyData
    @State private var isRepeated: Bool = false
    @State private var showRepeatAlert: Bool = false
    @State private var tutorial: Bool = false
    
    var body: some View {
        
        
        
        ZStack{
            
            
            //VSTACK FOR ALL ENTRIES
            VStack{
                
                HStack{
                   
                    Text("New Conflict")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Button{
                        tutorial.toggle()
                        
                        
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(.orange)
                            .font(.title2)
                            .padding(.leading, 5)
                    
                    }//button
                    .sheet(isPresented: $tutorial, content: {
                        NewConflictTutorial()
                            .presentationDetents([.fraction(0.55)])
                    })
                    
                    
                    Spacer()
                    
                }//hstack
                .padding(.leading)
                .padding(.top, 40)
                
                //Name prompt
                TextField("Conflict Name....", text: $data.conflictName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title2)
                    .padding()
                
                //Time prompt
                HStack{
                    Text("From")
                    DatePicker("", selection: $data.conflictStart, displayedComponents: [.hourAndMinute])
                        .labelsHidden()
                        .tint(.orange)
                    Text("to")
                    DatePicker("", selection: $data.conflictEnd, displayedComponents: [.hourAndMinute])
                        .labelsHidden()
                        .tint(.orange)
                    
                    
                }//hstack for times
                .font(.title2)
                Spacer()
            }//vstack
            
            
            
            //DONE BUTTON
            VStack{
                Spacer()
                
                
                if data.conflictEnd > data.conflictStart && data.conflictName != ""{
                    
                    Button {
                        
                        checkRepeat()
                        if isRepeated == false{
                            
                            if !data.conflictName.isEmpty && data.conflictStart != Date() && data.conflictEnd != Date() + 3600 {
                                
                                
                                data.conflictData = [
                                    
                                    "data": [
                                        
                                             "name": data.conflictName,
                                             
                                             "start": "\(data.conflictStart.formatted(date: .omitted, time: .shortened))",
                                             
                                             "end": "\(data.conflictEnd.formatted(date: .omitted, time: .shortened))",
                                             
                                            ]

                                ]
                                
                                data.conflictDataList.append(data.conflictData)
                                UserDefaults.standard.set(data.conflictDataList, forKey: "conflictDataList")
                                print(data.conflictDataList)
                                
                                data.conflictName = ""
                                data.conflictStart = Date()
                                data.conflictEnd = Date() + 3600
                                
                            }//appending data
                            
                            data.showEndTime = false
                            data.rshowEndTime = false
                            data.timerOn = true
                            dismiss()
                            
                        }//if name unique
                        else {
                            showRepeatAlert.toggle()
                            isRepeated.toggle()
                        }//present alert
                        
                        
                        
                    } label: {
                        //zstack for done button
                        ZStack{
                            Rectangle()
                                .frame(width:80, height:40)
                                .foregroundColor(.orange)
                                .cornerRadius(10)
                            Text("Done")
                                .foregroundColor(.white)
                                .font(.title3)
                        }//zstack of done button layer text and rect
                        .padding(.bottom)
                        
                    }//button
                    .alert("Caution!", isPresented: $showRepeatAlert) {
                        //default ok
                    } message: {
                        Text("There is another conflict with this name.")
                    }//message alert

                    
                    
                    
                    
                    
                }//if entries are good
                else{
                    
                    ZStack{
                        Rectangle()
                            .frame(width:80, height:40)
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                        Text("Done")
                            .foregroundColor(.white)
                            .font(.title3)
                        
                    }
                    .opacity(0.4)
                    .padding(.bottom)
                    
                    
                    
                }//if entries aren't good
                
                
                
            }//vstack move done button down
            .padding(.bottom)
         
                
            
            
            
            
            
            //X BUTTON
            
            //vstack to move x button up
            VStack{
                //hstack to move x button to side
                HStack{
                    Spacer()
                    
                    //x button
                    Button {
                        
                        data.showEndTime = false
                        data.rshowEndTime = false
                        data.timerOn = true
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                    }//button
                    
                    
                    
                }//hstack x button
                
                Spacer()
            }//vstack x button
            .padding(.trailing)
            .padding(.top)
            
            
            
        }//zsctak main
        
        
        
    }//body
    
    
    private func checkRepeat(){
        
        for index in data.conflictDataList.indices{
            
            if data.conflictName == data.conflictDataList[index]["data"]!["name"]{
                
                isRepeated.toggle()
                
                
            }//if repeat is found
            
        }//for loop to loop through all names
        
        
        
        
    }//repeating func
    
}//AddNewConflict

struct AddNewConflict_Previews: PreviewProvider {
    static var previews: some View {
        AddNewConflict().environmentObject(MyData())
    }
}
