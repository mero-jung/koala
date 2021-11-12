//
//  ViewModelBase.swift
//  MoviesApp
//
//  Created by 정태훈 on 2021/10/10.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
    
}
