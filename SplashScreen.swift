//
//  SplashScreen.swift
//  TM_Demo
//
//  Created by SamSan on 9/9/23.
//

import SwiftUI

struct SplashScreenView: View {
    
    
    @EnvironmentObject var data: MyData
    
    @State var isActive : Bool = false
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:120, height:120)
                    
                    Spacer()
                    Text("Demo App")
                        .font(.largeTitle)
                        .foregroundColor(.blue.opacity(0.80))
                }
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView().environmentObject(MyData())
    }
}
