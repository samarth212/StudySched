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
    @State public var showAddAssignments: Bool = false
    @State public var showAddConflicts: Bool = false
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var showEndTime: Bool = false
    @State private var deleteAssignment: Bool = false
    @State private var timerOn: Bool = true
  

    
    
    
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
                                if !data.eventDataList.isEmpty && timerOn{
                                    
                                    print("pluh")
                                    
                                    var indicesToRemove: [Int] = []
                                    
                                    for index in data.eventDataList.indices{
                                        
                                        
                                        
                                        if Date() > dateFormatter.date(from: data.eventDataList[index]["data"]!["end"]!)!{
                                            
                                            showEndTime.toggle()
                                            timerOn = false
                                            
                                            if deleteAssignment{
                                                indicesToRemove.append(index)
                                                
                                                
                                                
                                            }//if they continue with delete
                                            
                                            
                                            
                                        }//if date passed
                                        
   
                                    }//for loop
                                    if deleteAssignment{
                                        
                                        
                                        for index in indicesToRemove.reversed(){
                                            data.eventDataList.remove(at: index)
                                        }//for loop after orginal one
                                        
                                        print(data.eventDataList)
                                        

                                    }//if deleting
                                    
                                    
                                }//if empty
                                

                                
                                
                                
                            }//on recieve
                            .alert(isPresented: $showEndTime) {
                                Alert(
                                    title: Text("Warning"),
                                    message: Text("This assignment ended"),
                                    primaryButton: .default(Text("Extend due date")){
                                        timerOn = true

                                    },
                                    secondaryButton: .destructive(Text("Delete")){
                                        
                                        deleteAssignment = true
                                        timerOn = true

                                       
                                    
                                    }//delete
                                )//alert
                                
                            }//alert
                         
                        
                        
                

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
        
        
        
    }//cv body
    
    
}//contentview





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(MyData())
    }
}
