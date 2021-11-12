//
//  SignUpViewModel.swift
//  koala
//
//  Created by 정태훈 on 2021/10/25.
//

import Foundation
import UserNotifications

class SignUpViewModel: ViewModelBase {
    @Published var canPage: Int = 0
    
    @Published var allChecked: Bool = false {
        didSet {
            if(allChecked) {
                self.privacyChecked = true
                self.koalaChecked = true
            }
            
            if(privacyChecked && koalaChecked) {
                self.canPage = 2
            } else {
                self.canPage = 0
            }
        }
    }
    
    @Published var privacyChecked: Bool = false {
        didSet {
            if(!privacyChecked) {
                self.allChecked = false
            }
            
            if(privacyChecked && koalaChecked) {
                self.canPage = 2
            } else {
                self.canPage = 0
            }
        }
    }
    
    @Published var koalaChecked: Bool = false {
        didSet {
            if(!koalaChecked) {
                self.allChecked = false
            }
            
            if(privacyChecked && koalaChecked) {
                self.canPage = 2
            } else {
                self.canPage = 0
            }
        }
    }
    
    func dispose() {
        self.canPage = 0
        self.allChecked = false
        self.privacyChecked = false
        self.koalaChecked = false
    }
    
}
