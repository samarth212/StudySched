//
//  testFile.swift
//  TM_Demo
//
//  Created by SamSan on 9/10/23.
//

import SwiftUI

struct TestView: View {
    
    
    
    @State private var userInput = ""
    @State private var userValue = ""
    @State private var userValue2 = ""
 
    @State private var assignments: [[String:Any]] = []
    

    var body: some View {
        VStack {
            // Text fields for user input
            TextField("Enter name", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Enter a value", text: $userValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter a value", text: $userValue2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            
         
            
            Button("Add Data") {
                // Check if the input fields are not empty
                if !userInput.isEmpty && !userValue.isEmpty && !userValue2.isEmpty{
                    
                    
                    let dataDictionary: [String: Any] = [
                        "data": ["name":userInput, "val": userValue, "val2": userValue2],
                        "index": assignments.count // Store the index
                    ]
           
                    
                    assignments.append(dataDictionary)

                    
                    
                    
                    print(assignments)
                    // Clear the input fields
                    userInput = ""
                    userValue = ""
                    userValue2 = ""
                    
                }
            }
            .padding()

            /*
             // Update the indices of the remaining items
             for (index, _) in assignments.enumerated() {
                 assignments[index]["index"] = index}
             */
            
            
            
        }
     
    }//body
    
}//main

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}



/* dataDictionary["data"] = [userInput, userValue, userValue2]
 assignments.append(dataDictionary)
 dataDictionary["index"] = Array(arrayLiteral: String(describing: assignments.firstIndex(where: {$0 == dataDictionary})))*/
