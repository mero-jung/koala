//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 7/31/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

extension View {
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
    
    func embedNavigationView() -> some View {
        return NavigationView {
            self
        }
    }
    
}
