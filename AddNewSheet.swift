import SwiftUI

struct AddNewSheet: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data: MyData
    @State private var isRepeated: Bool = false
    @State private var showRepeatAlert: Bool = false
    @State private var showRecurring: Bool = false
    
    @State private var temp: String = ""
    
    @State private var isConflicted: Bool = false
    @State private var showConflictAlert: Bool = false
    
    var body: some View {
        
        
        //main view zstack
        ZStack{
            
            
            //vstack to hold all entries for event: NAME, DESC, START DATE, END DATE, DIFF, TYPE, WEEKEND
            VStack{
                Spacer()
                
                HStack{
                    Text("New Assignment")
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
                    
                    Toggle(
                        
                        
                        isOn: $data.eventRecurring,
                        label: {
                            Text("Recurring Event")
                                .font(.title3)
                        }//label
                            
                        

                    )//toggle
                    .tint(.blue)
                    .onChange(of: data.eventRecurring, perform: { newValue in
                        if newValue{
                            showRecurring.toggle()
                            data.eventName = ""
                            data.eventDesc = ""
                            data.eventDiff = "1-5 (increasing difficulty)"
                            data.eventType = "Assignment type..."
                            data.eventStart = Date()
                            data.eventEnd = Date()+86400
                            data.eventWeekend = false
                            data.diffDone = false
                            data.typeDone = false
                            
                        }
                        else{
                            data.rName = ""
                            data.rDesc = ""
                            data.rDiff = "1-5 (increasing difficulty)"
                            data.rType = "Assignment type..."
                            data.rStart = Date()
                            data.rEnd = Date() + (86400*14)
                            data.rDays = []
                            data.rTimeStart = Date()
                            data.rTimeEnd = Date() + 3600
                            data.rDiffDone = false
                            data.rTypeDone = false
                            
                            
                            
                        }
                    })//on change
                    .sheet(isPresented: $showRecurring) {
                        RecurringSheet()
                            .presentationDetents([.fraction(0.8)])
                    }//sheet
                    
                                    
                    
                    
                }//recurring
                .padding(.horizontal)
                
                VStack{
                    
                    
                    //Name prompt
                    TextField("Assignment Name....", text: data.eventRecurring ? $data.rName: $data.eventName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.title2)
                        
                    
                }//assignment name
                .padding()
                
                VStack{
                        
                    
                    TextField("Description....", text: data.eventRecurring ? $data.rDesc: $data.eventDesc)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                  
                    //Description prompt
                    
                        
                    
                }//desc
                .padding()
                
                

                
                if data.eventRecurring == false{
                    VStack{
                        
                        //Start date prompt
                        DatePicker("Start Date:", selection: $data.eventStart)
                            .font(.title2)
                    }//start date
                    .padding()
                  
                    VStack{
                        
                        //End date prompt
                        DatePicker("End Date:", selection: $data.eventEnd)
                            .font(.title2)
                        
                    }//end date
                    .padding(.horizontal)
                    
                }//if not recurring
                else{
                    
                    ZStack{
                        
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height/4.5)
                            .cornerRadius(10)
                            .foregroundColor(.gray).opacity(0.4)
                        
                        HStack{
                            
                            VStack{
                                
                                
                                ForEach(data.recurringDays){day in
                                    
                                    if day.isChecked{
                                        
                                        Text("\(day.name)")
        
                                        
                                    }//if its a day that recurrs
                                    
                                    
                                    
                                }//loop
                                
                                
                                
                                
                                
                            }//the days of the week
                            .padding()
                            
                            VStack{
                                Text("\(data.rStart.formatted(date: .numeric, time: .omitted))-"+"\(data.rEnd.formatted(date: .numeric, time: .omitted))")
                                Text("\(data.rTimeStart.formatted(date: .omitted, time: .shortened))-"+"\(data.rTimeEnd.formatted(date: .omitted, time: .shortened))")
                                
                            }//vstack
                            
                          
                            
                        }//hstack for all info
                        .font(.title3)
                        
                        
                    }//zstack for the recurring info
                    
                    
                    
                    
                }//what to show if not recurring
                
               
                
                
                
                
                VStack{
               
                    
                    //Difficulty prompt
                    Text("Select Assignment Difficulty")
                    Menu{
                        Button {
                            if data.eventRecurring{
                                data.rDiff = "1"
                                data.rDiffDone = true
                            }
                            else{
                                data.eventDiff = "1"
                                data.diffDone = true
                            }
                            
                        } label: {
                            Text("1")
                        }//diff 1
                        
                        Button {
                            if data.eventRecurring{
                                data.rDiff = "2"
                                data.rDiffDone = true
                                
                            }
                            else{
                                data.eventDiff = "2"
                                data.diffDone = true
                                
                            }
                            
                        } label: {
                            Text("2")
                        }//diff 2
                        
                        Button {
                            if data.eventRecurring{
                                data.rDiff = "3"
                                data.rDiffDone = true
                                
                            }
                            else{
                                data.eventDiff = "3"
                                data.diffDone = true
                            }
                            
                        } label: {
                            Text("3")
                        }//diff 3
                          
                        Button {
                            
                            if data.eventRecurring{
                                data.rDiff = "4"
                                data.rDiffDone = true
                                
                            }
                            else{
                                data.eventDiff = "4"
                                data.diffDone = true
                                
                            }
                            
                        } label: {
                            Text("4")
                        }//diff 4
                        
                        Button {
                            if data.eventRecurring{
                                data.rDiff = "5"
                                data.rDiffDone = true
                            }
                            else{
                                data.eventDiff = "5"
                                data.diffDone = true
                                
                            }
                            
                        } label: {
                            Text("5")
                        }//diff 5

                    } label: {
                        Label(
                            title: {Text(data.eventRecurring ? data.rDiff: data.eventDiff)},
                            icon: {Image(systemName:"plus")}
                        )//title label
                        
                        
                    }//drop down difficulty menu
                }//diff
                .padding()
                .font(.title3)
                
                VStack{
                    
                    //Type prompt
                    Text("Select Assignment Type")
                    Menu{
                        Button {
                            if data.eventRecurring{
                                data.rType = "Practice Problems"
                                data.rTypeDone = true
                            }
                            else{
                                data.eventType = "Practice Problems"
                                data.typeDone = true
                                
                            }
                            
                        } label: {
                            Text("Practice Problems")
                        }//diff 1
                        
                        Button {
                            if data.eventRecurring{
                                data.rType = "Read/Annotate Text"
                                data.rTypeDone = true
                                
                            }
                            else{
                                data.eventType = "Read/Annotate Text"
                                data.typeDone = true
                            }
                            
                        } label: {
                            Text("Read/Annotate Text")
                        }//diff 2
                        
                        Button {
                            if data.eventRecurring{
                                data.rType = "Oral Presentation"
                                data.rTypeDone = true
                                
                            }
                            else{
                                data.eventType = "Oral Presentation"
                                data.typeDone = true
                                
                            }
                            
                        } label: {
                            Text("Oral Presentation")
                        }//diff 3
                          
                        Button {
                            if data.eventRecurring{
                                data.rType = "Exam"
                                data.rTypeDone = true
                            }
                            else{
                                data.eventType = "Exam"
                                data.typeDone = true
                                
                            }
                           
                        } label: {
                            Text("Exam")
                        }//diff 4
                        
                        Button {
                            if data.eventRecurring{
                                data.rType = "Project"
                                data.rTypeDone = true
                            }
                            else{
                                data.eventType = "Project"
                                data.typeDone = true
                                
                            }
                            
                        } label: {
                            Text("Project")
                        }//diff 5

                    } label: {
                        Label(
                            title: {Text(data.eventRecurring ? data.rType: data.eventType)},
                            icon: {Image(systemName:"plus")}
                        )//title label
                        
                        
                    }//drop down type menu
                    Spacer()
                }//type
                .padding()
                .font(.title3)
                
                if data.eventRecurring != true{
                    VStack{
                        Toggle(
                            
                            
                            isOn: $data.eventWeekend,
                            label: {
                                Text("Work On Weekend")
                                    .font(.title3)
                            }//label

                        )//toggle
                        .tint(.blue)
                        
                        Spacer()
                    }//weekend
                    .padding(.horizontal)
                }//makes sure weekend option only on normal
                
                
                
                
                
                
                
                
              
                
                
            }//vstack sheet main
            
            
            
            
            
            
            
            
            
            //DONE BUTTON
            
            //vstack to move done button down
            VStack{
                Spacer()
                
                
                
                if data.eventRecurring{
                    //IF EVERYTHING IS ENTERED
                    if data.rDiffDone == true && data.rTypeDone == true && data.rName != "" && data.rDesc != "" && data.rEnd >= data.rStart + (86400*7) && data.rEnd > Date() && data.rTimeStart < data.rTimeEnd{
                        
                        Button {
                            
                            checkRepeat()
                            if isRepeated == false{
                                
                                
                                //check if values empty
                                if !data.rName.isEmpty && !data.rDesc.isEmpty && data.rDiff != "1-5 (increasing difficulty)" && data.rType != "Assignment type..." && data.rStart != Date() && data.rEnd != Date() + (86400*14) && data.rTimeStart != Date() && data.rTimeEnd != Date() + 3600 {
                                    
                                    for day in data.recurringDays{
                                        
                                        if day.isChecked{
                                            data.rDays.append(day.name)
                                            
                                        }//if recurring day
                                        
                                    }//loop
                                    
                                    data.recurringData = [
                                    
                                
                                        "data": ["name": data.rName, "desc": data.rDesc, "diff":data.rDiff,"type":data.rType, "startdate":"\(data.rStart.formatted(date: .complete, time: .omitted))", "enddate":"\(data.rEnd.formatted(date: .complete, time: .omitted))", "starttime":"\(data.rTimeStart.formatted(date: .omitted, time: .shortened))", "endtime": "\(data.rTimeEnd.formatted(date: .omitted, time: .shortened))", "days": "\(data.rDays)"]
                                    
                                    
                                    
                                    
                                    ]
                                    data.recurringDataList.append(data.recurringData)
                                    print(data.recurringDataList)
                                    
                                    data.rName = ""
                                    data.rDesc = ""
                                    data.rDiff = "1-5 (increasing difficulty)"
                                    data.rType = "Assignment type..."
                                    data.rStart = Date()
                                    data.rEnd = Date() + (86400*14)
                                    data.rDays = []
                                    data.rTimeStart = Date()
                                    data.rTimeEnd = Date() + 3600
                                    
                                    data.eventName = ""
                                    data.eventDesc = ""
                                    data.eventDiff = "1-5 (increasing difficulty)"
                                    data.eventType = "Assignment type..."
                                    data.eventStart = Date()
                                    data.eventEnd = Date()+86400
                                    data.eventWeekend = false
                                    
                                    
                                    
                                    
                                    
                                    
                                }//if values are empty
                                data.rDiffDone = false
                                data.rTypeDone = false
                                data.diffDone = false
                                data.typeDone = false
                                data.eventRecurring = false
                                data.recurringDays = [Days(name: "Sunday", isChecked: false), Days(name: "Monday", isChecked: false),Days(name: "Tuesday", isChecked: false),Days(name: "Wednesday", isChecked: false),Days(name: "Thursday", isChecked: false),Days(name: "Friday", isChecked: false),Days(name: "Saturday", isChecked: false)]
                                
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
                            Text("There is another assignment with this name.")
                        }//message alert
                        

                        
                        
                    }//if eveyrthing entered
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
                        
                    }//if isnt entered
                    
                    
                }//if recurring
                else{
                    
                    //IF EVERYTHING IS ENTERED
                    if data.diffDone == true && data.typeDone == true && data.eventName != "" && data.eventDesc != "" && data.eventStart < data.eventEnd && data.eventEnd > Date() {
                        
                      
                        Button {
                            
                                checkRepeat()
                                
                                if isRepeated == false{
                                    
                                    //check if values are empty
                                    if !data.eventName.isEmpty && !data.eventDesc.isEmpty && data.eventDiff != "1-5 (increasing difficulty)" && data.eventType != "Assignment type..." && data.eventStart != Date() && data.eventEnd != Date()+86400 {
                                        
                                        //create the dictionary for the assignment
                                        data.eventData = [
                                            
                                            "data": ["name":data.eventName, "desc":data.eventDesc, "diff":data.eventDiff, "type":data.eventType, "start":"\(data.eventStart.formatted(date: .complete, time: .shortened))", "end":"\(data.eventEnd.formatted(date: .complete, time: .shortened))", "weekend":"\(data.eventWeekend)"]
                                            
                                            //"index": ["placeholder": "\(data.eventDataList.count)"]
                                        
                                    
                                        ]
                                        
                                        //append that dictionary to the overall list of assignments
                                        data.eventDataList.append(data.eventData)
                                        print(data.eventDataList)
                                        
                               
                                            
                                        //clear up values for next iteration
                                        data.eventName = ""
                                        data.eventDesc = ""
                                        data.eventDiff = "1-5 (increasing difficulty)"
                                        data.eventType = "Assignment type..."
                                        data.eventStart = Date()
                                        data.eventEnd = Date()+86400
                                        data.eventWeekend = false
                                        
                                        data.rName = ""
                                        data.rDesc = ""
                                        data.rDiff = "1-5 (increasing difficulty)"
                                        data.rType = "Assignment type..."
                                        data.rStart = Date()
                                        data.rEnd = Date() + (86400*14)
                                        data.rDays = []
                                        data.rTimeStart = Date()
                                        data.rTimeEnd = Date() + 3600
                                        
                                        
                                    }//if values are empty
                                    
                                    data.diffDone = false
                                    data.typeDone = false
                                    data.rDiffDone = false
                                    data.rTypeDone = false
                                    data.eventRecurring = false
                                    data.recurringDays = [Days(name: "Sunday", isChecked: false), Days(name: "Monday", isChecked: false),Days(name: "Tuesday", isChecked: false),Days(name: "Wednesday", isChecked: false),Days(name: "Thursday", isChecked: false),Days(name: "Friday", isChecked: false),Days(name: "Saturday", isChecked: false)]
                                    
                                    data.showEndTime = false
                                    data.rshowEndTime = false
                                    data.timerOn = true
                                    dismiss()

                                    
                                }// if name is unique
                                else{
                                    showRepeatAlert.toggle()
                                    isRepeated.toggle()
                                }//present alert
                               
                                
                                
                                
                            
                            
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
                            Text("There is another assignment with this name.")
                        }//message alert
                        
                        
                    }//if entries are all done
                    
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
                        
                        
                    }//if entries aren't done or correct
                    
                }//if normal
                
                
                
                

            }//done button vstack down
            
            
            
    
            
            
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
    
    
    
}//AddNewSheet





struct Days: Identifiable{
    let id = UUID()
    let name: String
    var isChecked: Bool
    
    
}//holding data for checklist

struct AddNewSheet_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        AddNewSheet().environmentObject(MyData())
        //NewRecurringEvent().environmentObject(MyData())
    }
}
