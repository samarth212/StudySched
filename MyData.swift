//
//  MyData.swift
//  TM_Demo
//
//  Created by SamSan on 9/9/23.
//

import Foundation

class MyData: ObservableObject{
    
    
//Assignment stuff
//-----------------------------------------------------------------------------------------------------------
    @Published var eventData: [String:[String:String]] = [:]
    @Published var eventDataList: [[String:[String:String]]] = []
    
    @Published var eventName: String = ""
    @Published var eventDesc: String = ""
    @Published var eventStart: Date = Date()
    @Published var eventEnd: Date = Date()+86400
    @Published var eventDiff: String = "1-5 (increasing difficulty)"
    @Published var eventType: String = "Assignment type..."
    @Published var eventWeekend: Bool = false
    
    @Published var eventRecurring: Bool = false
    
    @Published var recurringData: [String:[String:String]] = [:]
    @Published var recurringDataList: [[String:[String:String]]] = []
    
    @Published var rName: String = ""
    @Published var rDesc: String = ""
    @Published var rStart = Date()
    @Published var rEnd = Date() + (86400*14)
    @Published var rDiff: String = "1-5 (increasing difficulty)"
    @Published var rType: String = "Assignment type..."
    @Published var rDiffDone: Bool = false
    @Published var rTypeDone: Bool = false
    @Published var rDays: [String] = []
    @Published var rTimeStart = Date()
    @Published var rTimeEnd = Date() + 3600
    
    
    
    @Published var recurringDays = [Days(name: "Sunday", isChecked: false), Days(name: "Monday", isChecked: false),Days(name: "Tuesday", isChecked: false),Days(name: "Wednesday", isChecked: false),Days(name: "Thursday", isChecked: false),Days(name: "Friday", isChecked: false),Days(name: "Saturday", isChecked: false)]
   
  
    @Published var diffDone: Bool = false
    @Published var typeDone: Bool = false
    @Published var infoData: [String] = ["", "", "", "", "", "", ""]
    @Published var infoRData: [String] = ["", "", "", "", "", "", "", "", ""]
  
    
    @Published var indexToEdit: Int = 0
    @Published var indexToDelete: Int = 0
    
//-------------------------------------------------------------------------------------------------------------

//Conflict stuff
    
    @Published var conflictData: [String:[String:String]] = [:]
    @Published var conflictDataList: [[String:[String:String]]] = []
    
    @Published var conflictName: String = ""
    @Published var conflictStart = Date()
    @Published var conflictEnd = Date() + 3600

    
    
    
//-------------------------------------------------------------------------------------------------------------
    
//Timer stuff
 
    @Published var timerOn: Bool = true
    @Published var showEndTime: Bool = false
    @Published var rshowEndTime: Bool = false


//-------------------------------------------------------------------------------------------------------------

//Algorithm stuff
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//-------------------------------------------------------------------------------------------------------------

}//MyData Class
