//
//  Timer.swift
//  TM_Demo
//
//  Created by SamSan on 10/28/23.
//

import Foundation


class MyTimer: ObservableObject{
    

    
    @Published var showEndTime: Bool = false
    @Published var deleteAssignment: Bool = false
    
    //@State var indicesToRemove: [Int] = []
    @Published var indexToRemove: Int = -1
    @Published var assignmentPassedName: String = ""
    
    @Published var rindexToRemove: Int = -1
    @Published var rassignmentPassedName: String = ""
    
    
    private var timer: Timer?
    let interval: DispatchTimeInterval = .seconds(5)

    func startTimer(){
        
        DispatchQueue.global(qos: .background).async{
            
        }
        
    }
    
    
    
    
}

/*
 
 .onReceive(timer){ _ in
     let dateFormatter = DateFormatter()
     dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy 'at' h:mm a"
     if data.resumeContentTimer{
         timerOn = true
     }
     
     
     if !data.eventDataList.isEmpty && timerOn{
         
         print("pluh")

         for index in data.eventDataList.indices{
             
             
             
             if Date() > dateFormatter.date(from: data.eventDataList[index]["data"]!["end"]!)!{
               
                 assignmentPassedName = data.eventDataList[index]["data"]!["name"] ?? "#NAME?"
                 
                 if deleteAssignment==false{
                     showEndTime = true
                     timerOn = false
                 }
                 

                 if deleteAssignment{
                     
                     //indicesToRemove.append(index)
                     indexToRemove = index
                     
                 }//if they continue with delete
                 

                 
             }//if date passed
             

         }//for loop
         if deleteAssignment{
             
             /*
             for index in indicesToRemove.reversed(){
                 //data.eventDataList.remove(at: index)
             }//for loop after orginal one
             */
             
             data.eventDataList.remove(at: indexToRemove)
             
             print(data.eventDataList)
             deleteAssignment = false
             //indicesToRemove = []
             indexToRemove = -1
             
            
             

         }//if deleting
         
         
     }//if empty
     

     
     
     
 }//on recieve
 .alert(isPresented: $showEndTime) {
     Alert(
         title: Text("Warning: a due date has passed."),
         message: Text("'\(assignmentPassedName)' has ended"),
         primaryButton: .default(Text("Extend due date")){
             timerOn = true

         },
         secondaryButton: .destructive(Text("Delete")){
             
             deleteAssignment = true
             timerOn = true

            
         
         }//delete
     )//alert
     
 }//alert
 */
