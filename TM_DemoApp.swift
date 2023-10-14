//
//  TM_DemoApp.swift
//  TM_Demo
//
//  Created by SamSan on 9/9/23.
//

import SwiftUI

@main
struct TM_DemoApp: App {
    @StateObject var data = MyData()
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(data)
        }
    }
}
