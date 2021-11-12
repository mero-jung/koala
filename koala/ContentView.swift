//
//  ContentView.swift
//  koala
//
//  Created by 정태훈 on 2021/10/11.
//
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State var isActive = true
    
    init() {
        self.authViewModel = AuthViewModel()
        UINavigationBar.appearance().tintColor = UIColor(named: "PrimaryBlack")
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "PrimaryOrange")
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(named: "DeactivateIndicatorColor")
    }
    
    var body: some View {
        LoginScreen()
            .environmentObject(self.authViewModel)
            //.eraseToAnyView()
    }
  /*
#if DEBUG
    @ObservedObject var iO = injectionObserver
#endif*/
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    /*
#if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
        UIHostingController(rootView: ContentView())
    }
#endif*/
}
