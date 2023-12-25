//
//  ContentView.swift
//  TM_Demo
//
//  Created by SamSan on 9/9/23.
//

import SwiftUI
import Foundation

 

struct ContentView: View {
    
    @EnvironmentObject var data: MyData

    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    @State public var showAddAssignments: Bool = false
    @State public var showAddConflicts: Bool = false

    @State var deleteAssignment: Bool = false
    @State var indexToRemove: Int = -1
    @State var assignmentPassedName: String = ""
    
    @State var rdeleteAssignment: Bool = false
    @State var rindexToRemove: Int = -1
    @State var rassignmentPassedName: String = ""
    
    @State var dueDate: Date = Date()+86400

    @State var bothTypesDue: Bool = false
    
    
    @State var indicesToRemove: [Int] = []
    @State var rindicesToRemove: [Int] = []

        
    var body: some View {
        
        
        NavigationView{
            //zstack for main home view
            ZStack{
                
                
                //ALL OUTER NEW VIEW BUTTONS
                VStack(spacing:10){
                    
                    //hstack: THIS CONTAINS TITLE, ADD BUTTON, CONFLICT BUTTON,
                    HStack(spacing:15){

                        //Add New Event Button
                        Button {
                            showAddAssignments.toggle()

                        } label: {
     
                            HStack(spacing:3){
                                Image(systemName: "plus")
                                    .font(.title2)
                                Text("Assignment")
                                    .font(.headline)
                                    .fontWeight(.regular)
                                
                            }//hstack
                            .foregroundColor(.blue)
                            
                        }//button
                        .sheet(isPresented: $showAddAssignments) {
                            AddNewSheet()
                        }//add sheet
                        
                        
                        
                        //Add New Conflict Button
                        Button {
                       
                            showAddConflicts.toggle()
                            
                        } label: {
                            
                            HStack(spacing:3){
                                Image(systemName: "plus")
                                    .font(.title2)
                                Text("Conflict")
                                    .font(.headline)
                                    .fontWeight(.regular)
                                
                            }//hstack
                            .foregroundColor(.orange)
                            
                        }//button
                        .sheet(isPresented: $showAddConflicts) {
                            AddNewConflict()
                        }//add sheet
                        
                        

                        Spacer()
                        
                    }//hstack
                    .padding(.top)
                    .padding(.leading)
                    .onAppear(){
                        UIApplication.shared.applicationIconBadgeNumber = 0
                    }//clearing the notification icon
                    
                    
                    //My Schedule Text and Refresh
                    HStack(spacing: 20){
                        Text("My Schedule")
                            .font(.title)
                            .fontWeight(.semibold)
                            .onReceive(timer){ _ in
                                
                                if data.timerOn{
                                    let dateFormatter = DateFormatter()
                                     dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy 'at' h:mm a"
                                                                        
                                    if !data.eventDataList.isEmpty && !data.recurringDataList.isEmpty{
                                        for i in data.eventDataList.indices{
                                            
                                            let tempDate = dateFormatter.date(from: data.eventDataList[i]["data"]!["end"]!)
                                            
                                            for j in data.recurringDataList.indices{
                                                
                                                let rtempDate = dateFormatter.date(from: "\(data.recurringDataList[j]["data"]!["enddate"]!) at \(data.recurringDataList[j]["data"]!["endtime"]!)")
                                                
                                                if tempDate == rtempDate && tempDate ?? Date() < Date() && rtempDate ?? Date() < Date() {
                                                    
                                                    bothTypesDue = true
                                                    
                                                    if !indicesToRemove.contains(i){
                                                        indicesToRemove.append(i)
                                                    }//checking for no double indexing
                                                    
                                                    if !rindicesToRemove.contains(j){
                                                        rindicesToRemove.append(j)
                                                    }//checking for no double indexing
                                                    
                                                    print(indicesToRemove, rindicesToRemove)
                                                }//if match in dates
                                                
                                            }//looping through the dates of the recurrings
                                            
  
                                            
                                        }//looping through the dates of events
                                        
                                        
                                        
                                    }//making sure both exist
                                    
                                    
                                    if bothTypesDue{
                                        
                                        for i in indicesToRemove.reversed(){
                                            
                                            data.eventDataList.remove(at: i)
                                            UserDefaults.standard.set(data.eventDataList, forKey: "eventDataList")
                                            print(data.eventDataList)
                                        }//looping through all matching and deleting all
                                        for j in rindicesToRemove.reversed(){
                                            data.recurringDataList.remove(at: j)
                                            print(data.recurringDataList)
                                        }//looping through all matching and deleting all
                                        indicesToRemove = []
                                        rindicesToRemove = []
                                        bothTypesDue = false
                                    }//if both types due
                                    else{
                                        if !data.eventDataList.isEmpty{
                                            
                                            print("showAdd: \(showAddAssignments), alert: \(data.showEndTime)")

                                            for index in data.eventDataList.indices{
                                                
                                                if Date() > dateFormatter.date(from: data.eventDataList[index]["data"]!["end"]!)!{
                                                  
                                                                                     
                                                    assignmentPassedName = data.eventDataList[index]["data"]!["name"] ?? "#NAME?"
                                                    
                                               
                                                    
                                                    if deleteAssignment==false{
                                                        data.timerOn = false
                                                        data.showEndTime = true
                                                      
                                                    }
                                                    else{
                                                        indexToRemove = index

                                                    }//remove
                                                    
                                

                                                    
                                                }//if date passed
                                                

                                            }//for loop
                                            if deleteAssignment{
                                                
                                              
                                                
                                                data.eventDataList.remove(at: indexToRemove)
                                                print(data.eventDataList)
                                                UserDefaults.standard.set(data.eventDataList, forKey: "eventDataList")

                                                deleteAssignment = false
                                                indexToRemove = -1
                                               
                                                

                                            }//if deleting
                                            
                                            
                                        }//if empty
                                        
                                        if !data.recurringDataList.isEmpty{
                                            
                                            for index in data.recurringDataList.indices{
                                                
                                                let rDate = "\(data.recurringDataList[index]["data"]!["enddate"]!) at \(data.recurringDataList[index]["data"]!["endtime"]!)"
                                                
                                                    
                                                if Date() > dateFormatter.date(from: rDate) ?? (Date()+86400){
                                                    
                                                                                                    
                                                    rassignmentPassedName = data.recurringDataList[index]["data"]!["name"] ?? "#NAME?"
                                                    
                                                    if rdeleteAssignment==false{
                                                        data.timerOn = false
                                                        data.rshowEndTime = true
                                                    }
                                                    else{
                                                        rindexToRemove = index
                                                    }//remove
                                                    
                                                    
                                                }//if date has passed
                                                
                                                
                                            }//loop
                                            if rdeleteAssignment{
                                                data.recurringDataList.remove(at: rindexToRemove)
                                                print(data.recurringDataList)
                                                rdeleteAssignment = false
                                                rindexToRemove = -1
                                            }//if deleting recurring
                                            
                                        }//if recurring empty
                                    }//if both types are not due
                                    

                                    
                                }//while timer is running
                                
                                

                                
                                
                                
                            }//on recieve
                            
                        
                        
                        
                

                        Spacer()
                        
                    }//hstack title
                    .padding(.leading)
                    
                    
                    
                    
                    
                    
                    
                    Spacer()
                    
                    //Assignments and conflicts button
                    HStack{
                        
                        
                        NavigationLink(
                            destination: AssignmentsTab(),
                            label: {
                                
                                ZStack{
                                    
                                    Rectangle()
                                        .frame(width:70, height:70)
                                        .cornerRadius(25)
                                        .foregroundColor(.blue)
                                    Image(systemName: "list.bullet.clipboard")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        
                                        
                                    
                                    
                                }//button zstack
                                
                                
                                
                              
                            }//button
                        )//navigation link assignments
                        
                        Spacer()
                        
                        NavigationLink(
                            destination: ConflictsTab(),
                            label: {
                                
                                ZStack{
                                    
                                    Rectangle()
                                        .frame(width:70, height:70)
                                        .cornerRadius(25)
                                        .foregroundColor(.orange)
                                    Image(systemName: "calendar.badge.exclamationmark")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        
                                        
                                    
                                    
                                }//button zstack
                                
                                
                                
                              
                            }//button
                        )//navigation link conflicts
                       
                        
                        
                        
                        
                    }//hstack for spacing the bottom buttons
                    .padding(.horizontal, 30)
                    .padding(.bottom, 5)
                    
                    
                    
                }//vstack main
            
                 
            }//zstack main
            .alert(isPresented: $data.rshowEndTime) {
                Alert(
                    title: Text("Warning: a due date has passed."),
                    message: Text("'\(rassignmentPassedName)' has ended"),
                    dismissButton: .destructive(Text("Delete"),
                            action: {
                             rdeleteAssignment = true
                             data.timerOn = true
                            })
                   
                )//alert
                
            }//alert
            
        }//navigation view
        .alert(isPresented: $data.showEndTime) {
            Alert(
                title: Text("Warning: a due date has passed."),
                message: Text("'\(assignmentPassedName)' has ended"),
                primaryButton: .default(Text("Extend due date")){
                    
                    data.timerOn = true
                },
                secondaryButton: .destructive(Text("Delete")){
                    
                    
                    deleteAssignment = true
                    data.timerOn = true
           
                }//delete
            )//alert
            
        }//alert
        
        
        
        
        
        
        
        
    }//cv body
    
    
}//contentview





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(MyData())
    }
}


