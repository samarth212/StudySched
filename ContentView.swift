//
//  ContentView.swift
//  TM_Demo
//
//  Created by SamSan on 9/9/23.
//

import SwiftUI



struct ContentView: View {
    
    @EnvironmentObject var data: MyData
    @State public var showAddAssignments: Bool = false
    @State public var showAddConflicts: Bool = false
    
    
    
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
                    
                    
                    //My Schedule Text
                    HStack{
                        Text("My Schedule")
                            .font(.title)
                            .fontWeight(.semibold)
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
