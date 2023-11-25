//
//  TM_DemoApp.swift
//  TM_Demo
//
//  Created by SamSan on 9/9/23.
//

import SwiftUI
import BackgroundTasks

@main
struct StudySchedApp: App {
    @StateObject var _data = MyData()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(_data)
                
        }
    }
    
    
    
    
  
    
    
}
