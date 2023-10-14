//
//  EditAssignment.swift
//  TM_Demo
//
//  Created by SamSan on 9/17/23.
//

import SwiftUI

struct EditAssignment: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data: MyData
    @State private var isRepeated: Bool = false
    @State private var showRepeatAlert: Bool = false
    
   
   
    var body: some View {
        
        //main view zstack
        ZStack{
            
            //vstack to hold all entries for event: NAME, DESC, START DATE, END DATE, DIFF, TYPE
            VStack{
                Spacer()
                
                HStack{
                    Text("Edit Assignment")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.leading, 10)
                    Button {
                        print("tutorial")
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .padding(.leading, 5)
                    }//label for questionmark

                    Spacer()
                    
                }//hstack title text
                .padding(.top, 40)
                
                VStack{
                    
                    
                    //Name prompt
                    TextField("\(data.eventDataList[data.indexToEdit]["data"]!["name"] ?? "none")", text: $data.eventName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.title2)
                        
                    
                }//assignment name
                .padding()
                
                VStack{
                        
                    //Description prompt
                    TextField("\(data.eventDataList[data.indexToEdit]["data"]!["desc"] ?? "none")", text: $data.eventDesc)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                  
                   
                    
                        
                    
                }//desc
                .padding()
                
                VStack{
                    
                    //Start date prompt
                    DatePicker("Start Date:", selection: $data.eventStart)
                        .font(.title2)
                        .onAppear{
                            
                            let formatter = DateFormatter()
                            let string = data.eventDataList[data.indexToEdit]["data"]!["start"]
                            formatter.dateFormat = "MM/dd/yyyy, h:mm a"

                            data.eventStart = formatter.date(from: string ?? "none") ?? Date()
                            
                        }
                    
                    
                }//start date
                .padding()
              
                VStack{
                    
                    //End date prompt
                    DatePicker("End Date:", selection: $data.eventEnd)
                        .font(.title2)
                        .onAppear{
                            
                            let formatter2 = DateFormatter()
                            let string2 = data.eventDataList[data.indexToEdit]["data"]!["end"]
                            formatter2.dateFormat = "MM/dd/yyyy, h:mm a"

                            data.eventEnd = formatter2.date(from: string2 ?? "none") ?? Date()+86400
                            
                        }
                    
                }//end date
                .padding()
                
                
                
                VStack{
               
                    
                    //Difficulty prompt
                    Text("Select Assignment Difficulty")
                    Menu{
                        Button {
                            data.eventDiff = "1"
                            
                        } label: {
                            Text("1")
                        }//diff 1
                        
                        Button {
                            data.eventDiff = "2"
                          
                        } label: {
                            Text("2")
                        }//diff 2
                        
                        Button {
                            data.eventDiff = "3"
                           
                        } label: {
                            Text("3")
                        }//diff 3
                          
                        Button {
                            data.eventDiff = "4"
                           
                        } label: {
                            Text("4")
                        }//diff 4
                        
                        Button {
                            data.eventDiff = "5"
                            
                        } label: {
                            Text("5")
                        }//diff 5

                    } label: {
                        
                            
                            if data.eventDiff == "1-5 (increasing difficulty)"{
                                
                            Label(
                                title: {Text (data.eventDataList[data.indexToEdit]["data"]!["diff"] ?? "none")  },
                                icon: {Image(systemName:"plus")}
                            
                            )//label
                            
                               
                            }//if current choosing hasn't changed
                            else{
                                
                            Label(
                                title: {Text ( data.eventDiff  )  },
                                icon: {Image(systemName:"plus")}
                            
                            )//label
                            
                                
                            }//if current choosing has changed
                            
                        
                        
                        
                    }//drop down difficulty menu
                }//diff
                .padding()
                .font(.title3)
                
                VStack{
                    
                    //Type prompt
                    Text("Select Assignment Type")
                    Menu{
                        Button {
                            data.eventType = "Practice Problems"
                            
                        } label: {
                            Text("Practice Problems")
                        }//diff 1
                        
                        Button {
                            data.eventType = "Read/Annotate Text"
                          
                        } label: {
                            Text("Read/Annotate Text")
                        }//diff 2
                        
                        Button {
                            data.eventType = "Oral Presentation"
                       
                        } label: {
                            Text("Oral Presentation")
                        }//diff 3
                          
                        Button {
                            data.eventType = "Exam"
                         
                        } label: {
                            Text("Exam")
                        }//diff 4
                        
                        Button {
                            data.eventType = "Project"
                           
                        } label: {
                            Text("Project")
                        }//diff 5

                    } label: {
                        
                        
                        if data.eventType == "Assignment type..."{
                            
                        Label(
                            title: {Text (data.eventDataList[data.indexToEdit]["data"]!["type"] ?? "none")  },
                            icon: {Image(systemName:"plus")}
                        
                        )//label
                        
                           
                        }//if current choosing hasn't changed
                        else{
                            
                        Label(
                            title: {Text ( data.eventType  )  },
                            icon: {Image(systemName:"plus")}
                        
                        )//label
                        
                            
                        }//if current choosing has changed
                        
                        
                        
                        
                        
                    }//drop down type menu
                    Spacer()
                }//type
                .padding()
                .font(.title3)
                
    
                VStack{
                    Toggle(
                        
                        
                        
                        
                        isOn: $data.eventWeekend,
                        label: {
                            Text("Work On Weekend (By default, editing an assignment will turn this off.)")
                                .font(.headline)
                                .fontWeight(.regular)
                        }

                    )
                    .tint(.blue)
                    
                    Spacer()
                }//weekend
                .padding()
                
                
            }//vstack sheet main
            
            
            
            
            //DONE BUTTON
            
            //vstack to move done button down
            VStack{
                Spacer()

                    
                if data.eventStart < data.eventEnd && data.eventEnd > Date(){
                    
                    Button {
                        
                        checkRepeat()
                        if isRepeated == false{
                            
                            if data.eventName != ""{
                                data.eventDataList[data.indexToEdit]["data"]!["name"] = data.eventName
                            }//if name changes
                            
                            if data.eventDesc != ""{
                                data.eventDataList[data.indexToEdit]["data"]!["desc"] = data.eventDesc
                            }//if desc changes
                            
                            if "\(data.eventStart.formatted(date: .complete, time: .shortened))" != data.eventDataList[data.indexToEdit]["data"]!["start"]{
                                data.eventDataList[data.indexToEdit]["data"]!["start"] = "\(data.eventStart.formatted(date: .complete, time: .shortened))"
                                
                            }//if date changes
                            
                            if "\(data.eventEnd.formatted(date: .complete, time: .shortened))" != data.eventDataList[data.indexToEdit]["data"]!["end"]{
                                data.eventDataList[data.indexToEdit]["data"]!["end"] = "\(data.eventEnd.formatted(date: .complete, time: .shortened))"
                                
                            }//if date changes
                            
                            if data.eventDiff != "1-5 (increasing difficulty)"{
                                data.eventDataList[data.indexToEdit]["data"]!["diff"] = data.eventDiff
                            }//if diff changes
                            
                            if data.eventType != "Assignment type..."{
                                data.eventDataList[data.indexToEdit]["data"]!["type"] = data.eventType
                            }//if type changes
                            
                            data.eventDataList[data.indexToEdit]["data"]!["weekend"] = "\(data.eventWeekend)"
                            
                            
                            
                            
                           
                       
                            
                            
                            
                            print(data.eventDataList)
                            
                            
                            //clear up values for next iteration
                            data.eventName = ""
                            data.eventDesc = ""
                            data.eventDiff = "1-5 (increasing difficulty)"
                            data.eventType = "Assignment type..."
                            data.eventStart = Date()
                            data.eventEnd = Date()+86400
                            data.eventWeekend = false
                            
                            
                            
                            dismiss()
                            
                            
                            
                        }// if name unique
                        else{
                            showRepeatAlert.toggle()
                            isRepeated.toggle()
                        }//alert presented
                        
                        
                        
                    } label: {
                        
                        //zstack for done button
                        ZStack{
                            Rectangle()
                                .frame(width:80, height:40)
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                            Text("Done")
                                .foregroundColor(.white)
                                .font(.title3)
                        }//zstack of done button layer text and rect
                        
                        
                    }//button
                    .padding(.bottom)
                    .alert("Caution!", isPresented: $showRepeatAlert) {
                        //default ok
                    } message: {
                        Text("There is another assignment with this name. If you are attempting to change the name to its current name, leave this field blank.")
                    }//message alert
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }// if dates are correct
                
                
                else{
                    ZStack{
                        Rectangle()
                            .frame(width:80, height:40)
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                        Text("Done")
                            .foregroundColor(.white)
                            .font(.title3)
                        
                    }.opacity(0.4)
                    
                    
                }//if dates not correct
                    
              

            }//done button vstack down
            
            
            

            
            
            
            
            
            
        }//zstack main
        
        
        
        
        
        
        
    }//body
    
    private func checkRepeat() {
        for index in data.eventDataList.indices{
            
            if data.eventName == data.eventDataList[index]["data"]!["name"] || data.rName == data.eventDataList[index]["data"]!["name"]{
                
                isRepeated.toggle()
                
                
            }//if repeat is found
            
        }//for loop to loop through all names
        
        if isRepeated != true{
            for index in data.recurringDataList.indices{
                
                if data.eventName == data.recurringDataList[index]["data"]!["name"] || data.rName == data.recurringDataList[index]["data"]!["name"]{
                    
                    //print("test")
                    isRepeated.toggle()
                    
                    
                }//if repeat is found
                
            }//for loop to loop through all names
            
        }//if it hasnt found a repeat yet in the event list
        
    }//checkRepeat function
    
    
    
    
    
}//EditAssignment

struct EditAssignment_Previews: PreviewProvider {
    static var previews: some View {
        EditAssignment().environmentObject(MyData())
    }
}
