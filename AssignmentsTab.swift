//
//  AssignmentsTab.swift
//  TM_Demo
//
//  Created by SamSan on 9/13/23.
//

import SwiftUI

struct AssignmentsTab: View {
    
    @State var showInfo: Bool = false
    @State var showEdit: Bool = false
    
    @State var showRInfo: Bool = false
 
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data: MyData

    var body: some View {

        //main view zstac
        ZStack{
            
            
            VStack{
                
                //LIST FOR NORMAL
                List{
                            
                            
                    ForEach(data.eventDataList.indices, id: \.self) { index in
                                
                                
                                let maindict = data.eventDataList[index]
                                let dictData = maindict["data"]
                                let name = dictData?["name"]
                                let description = dictData?["desc"]
                                let startDate = dictData?["start"]
                                let endDate = dictData?["end"]
                                let difficulty = dictData?["diff"]
                                let type = dictData?["type"]
                                let weekend = dictData?["weekend"]
                                
                                
                                //main hstack
                                HStack{
                                    
                                        ScrollView(.horizontal){
                                            Text(name ?? "none")
                                                .font(.title3)
                                        }//scroll view
                                          
                                    
                                    //info
                                    HStack{
                                        
                                        Button {
                                            
                                            showInfo.toggle()
                                           
                                           
                                            
                                            data.infoData = [name ?? "none", description ?? "none", difficulty ?? "none", type ?? "none", startDate ?? "\(Date())", endDate ?? "\(Date())", weekend ?? "false"]
                                            
                                        } label: {
                                            Image(systemName: "info.circle.fill")
                                                .foregroundColor(.blue)
                                                .font(.title2)
                                        }//info button
                                        .buttonStyle(.plain)
                                        .sheet(isPresented: $showInfo) {
                                            AssignmentInfo()
                                                .presentationDetents([.fraction(0.5)])
                                                .interactiveDismissDisabled()
                                        }//pop up card for info
                                        
                                        
                                        
                                        
                                    }//info
                                    
                                    //edit
                                    HStack{
                                        //EDIT BUTTON
                                        Button {
                                            data.indexToEdit = index
                                            
                                            showEdit.toggle()
                                            
                                            
                                            
                                        } label: {
                                            Image(systemName: "square.and.pencil")
                                                .font(.title)
                                                .foregroundColor(.blue)
                                        }//edit button
                                        .buttonStyle(.plain)
                                        .sheet(isPresented: $showEdit) {
                                            EditAssignment()
                                        }//edit sheet
                                        
                                        
                                    }//edit
                                        

                                      
                              
                                        
                
                                            
                                        
                                            
                               
                                }//main view hstack
                                    
                                
                                    
                                    
                                    
                                
                        
                            }//names loop
                .onDelete(perform: deleteAssignment)//deleting assignments
                            
                            
                        

                    
                    
                    
                    
                    
                    
                }//list
                .frame(height:UIScreen.main.bounds.height/2.25)
                .padding(.top)
                
                
                
                
                
                
                
                
                
                
                
                
                
                HStack{
                    Text("Recurring Assignments")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    
                    
                }//move text left
                .padding(.leading)
                
                //LIST FOR RECURRING
                List{
                    
                    ForEach(data.recurringDataList.indices, id: \.self){ index in
                        
                        let rmaindict = data.recurringDataList[index]
                        let rdictData = rmaindict["data"]
                        let rname = rdictData?["name"]
                        let rdescription = rdictData?["desc"]
                        let rstartDate = rdictData?["startdate"]
                        let rendDate = rdictData?["enddate"]
                        let rstartTime = rdictData?["starttime"]
                        let rendTime = rdictData?["endtime"]
                        let rdays = rdictData?["days"]
                        let rdifficulty = rdictData?["diff"]
                        let rtype = rdictData?["type"]
                        
                        
                        HStack{
                            
                            ScrollView(.horizontal){
                                Text(rname ?? "none")
                                    .font(.title3)
                            }//scroll view
                            
                            //info
                            HStack{
                                
                                
                                Button {
                                    
                                    showRInfo.toggle()
                                    
                                    data.infoRData = [rname ?? "none", rdescription ?? "none", rstartDate ?? "\(Date().formatted(date: .numeric, time: .omitted))", rendDate ?? "\(Date().formatted(date: .numeric, time: .omitted))", rstartTime ?? "\(Date().formatted(date: .omitted, time: .shortened))", rendTime ?? "\(Date().formatted(date: .omitted, time: .shortened))", rdays ?? "Every Day (Default)", rdifficulty ?? "none", rtype ?? "none"]
                                   
                                    
                                    
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                        .foregroundColor(.blue)
                                        .font(.title2)
                                }//info button
                                .buttonStyle(.plain)
                                .sheet(isPresented: $showRInfo) {
                                    RecurringInfo()
                                        .presentationDetents([.fraction(0.55)])
                                        .interactiveDismissDisabled()
                                   
                                    
                                }//pop up card for info
                                
                                
                                
                            }//show info

                            
                            
                            
                        }//hstack main
                        
                        
                        
                    }//loop
                .onDelete(perform: deleteRAssignment)//deleting assignments recurring 
                    
                    
                }//list
                .frame(height: UIScreen.main.bounds.height/3)
                
                Spacer()
            }//vstack to move list up
            .padding(.top, 55)
            
            
            
            
            //TITLE AND EXIT BUTTON
            VStack{
                
                //hstack to move left
                HStack{
                    
                    Text("My Assignments")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    
                    //TUTORIAL BUTTON
                    Button {
                        print("tutorial")
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title2)
                    }//tutorial button
                    
                    
                    
                    Spacer()
                    
                    
                    
                    
                    
                }//hstack move left
                .padding(.leading, 20)
                .padding(.top, 30)
                
                
                Spacer()
                
                
                
                
                
            }//vstack move title up
            
                
       
            

            
       
            
            
            
           
            
            
            
            
            
            
            
            
        }//zstack main
        
        
        
        
        
        
        
        
        
    }//body
    
    func deleteAssignment(indexSet: IndexSet){
        
            data.eventDataList.remove(atOffsets: indexSet)
            print(data.eventDataList)
            
        
    
        
    }//delete func
    
    func deleteRAssignment(indexSet: IndexSet){
        
            data.recurringDataList.remove(atOffsets: indexSet)
            print(data.recurringDataList)
            
        
    
        
    }//delete func
    
    
    
}//AssignmentsTab








struct AssignmentsTab_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentsTab().environmentObject(MyData())
    }
}
