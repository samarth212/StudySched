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

    @State var showEndTime: Bool = false
    @State var deleteAssignment: Bool = false
    @State var indexToRemove: Int = -1
    @State var assignmentPassedName: String = ""
    
    @State var rindexToRemove: Int = -1
    @State var rassignmentPassedName: String = ""
    
    @State var alertSet: Set<String> = Set()


    
    
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
                    
                    
                    //My Schedule Text and Refresh
                    HStack(spacing: 20){
                        Text("My Schedule")
                            .font(.title)
                            .fontWeight(.semibold)
                            .onReceive(timer){ _ in
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy 'at' h:mm a"
                                
                                
                                if !data.eventDataList.isEmpty{
                                    
                                    print("showAdd: \(showAddAssignments), alert: \(showEndTime)")

                                    for index in data.eventDataList.indices{
                                        
                                        
                                        
                                        if Date() > dateFormatter.date(from: data.eventDataList[index]["data"]!["end"]!)!{
                                          
                                            //showAddAssignments = false
                                            assignmentPassedName = data.eventDataList[index]["data"]!["name"] ?? "#NAME?"
                                            
                                            if deleteAssignment==false{
                                                showEndTime.toggle()
                                              
                                            }
                                            else{
                                                indexToRemove = index

                                            }//remove
                                            
                                            

                                            
                                        }//if date passed
                                        

                                    }//for loop
                                    if deleteAssignment{
                                        
                                      
                                        
                                        data.eventDataList.remove(at: indexToRemove)
                                        
                                        print(data.eventDataList)
                                        deleteAssignment = false
                                        indexToRemove = -1
                                        
                                       
                                        

                                    }//if deleting
                                    
                                    
                                }//if empty
                                

                                
                                
                                
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
        }//navigation view
        .alert(isPresented: $showEndTime) {
            Alert(
                title: Text("Warning: a due date has passed."),
                message: Text("'\(assignmentPassedName)' has ended"),
                primaryButton: .default(Text("Extend due date")){
       
                },
                secondaryButton: .destructive(Text("Delete")){
                    
                    deleteAssignment = true
           
                }//delete
            )//alert
            
        }//alert
        
        
        
    }//cv body
    
    
}//contentview





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MyData())
    }
}


