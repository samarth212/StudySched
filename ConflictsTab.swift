//
//  ConflictsTab.swift
//  TM_Demo
//
//  Created by SamSan on 9/24/23.
//

import SwiftUI

struct ConflictsTab: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data: MyData

    var body: some View {
        
        
        
        
        //zstack main
        ZStack{
            
            
            //vstack for list
            VStack{
                
                //list for conflicts
                List{
                    
                    ForEach(data.conflictDataList.indices, id: \.self){ index in
                        
                        let cmaindict = data.conflictDataList[index]
                        let cdictData = cmaindict["data"]
                        let cname = cdictData?["name"]
                        let cstart = cdictData?["start"]
                        let cend = cdictData?["end"]
                        
                        
                        let defaultEnd = Date() + 3600 //default for the dat since it gives error
                        

                        //main view hstack
                        HStack{
                            
                            ScrollView(.horizontal){
                                Text(cname ?? "none")
                                    .font(.title3)
                            }//scroll view
                            
                            
                            Text(cstart ?? "\(Date().formatted(date: .omitted, time: .shortened))")
                                .foregroundColor(.orange)
                            Text("to")
                            Text(cend ?? "\(defaultEnd.formatted(date: .omitted, time: .shortened))")
                                .foregroundColor(.orange)
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        }//hstack main
                        
                        
                        
                    }//names loop
                .onDelete(perform: deleteConflict)
                    
                    
                    
                    
                    
                }//list
                
                
                
            }//vstack for list
            .padding(.top, 55)
            
            //TITLE AND EXIT BUTTON
            VStack{
                
                //hstack to move left
                HStack{
                    
                    Text("My Conflicts")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    
                    //TUTORIAL BUTTON
                    Button {
                        print("tutorial")
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(.orange)
                            .font(.title2)
                    }//tutorial button
                    
                    
                    
                    Spacer()
                    
                    
                    
                    
                    
                }//hstack move left
                .padding(.leading, 20)
                .padding(.top)
                
                
                Spacer()
                
                
                
                
                
            }//vstack move title up
            
            
            
            
        }//zstack main
        
        
     
        
        
        
        
    }//body
    
    private func deleteConflict(indexSet: IndexSet){
        
        data.conflictDataList.remove(atOffsets: indexSet)
        UserDefaults.standard.set(data.conflictDataList, forKey: "conflictDataList")
        print(data.conflictDataList)
        
    }//delete func
     
}//ConflictsTab

struct ConflictsTab_Previews: PreviewProvider {
    static var previews: some View {
        ConflictsTab().environmentObject(MyData())
    }
}
