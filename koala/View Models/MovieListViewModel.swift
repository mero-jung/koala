//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by 정태훈 on 2021/10/10.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class MovieListViewModel: ViewModelBase {
    @Published var movies = [MovieViewModel]()
    var subscriptions: Set<AnyCancellable> = []
    
    func searchByName(_ name: String) {
        
        if name.isEmpty {
            self.loadingState = .failed
            return
        }
        
        self.loadingState = .loading
        
        APIClient.getMovies(search: name)
            .map {
                $0.movies
            }
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                        //Toast.show("동기화 완료")
                    DispatchQueue.main.async {
                        self.loadingState = .success
                    }
                    break
                    case .failure(let error):
                        switch error {
                        case .http(let error):
                            //Toast.show(error.message)
                            DispatchQueue.main.async {
                                self.loadingState = .failed
                            }
                            break
                        case .unknown:
                            //Toast.show("동기화 중 에러가 발생했습니다. 다시 시도해 주세요.")
                            DispatchQueue.main.async {
                                self.loadingState = .failed
                            }
                            break
                        }
                }
            },
            receiveValue: { data in
                DispatchQueue.main.async {
                    self.movies = data.map(MovieViewModel.init)
                }
            })
            .store(in: &self.subscriptions)
            
    }
}

struct MovieViewModel {
    let movie: Movie
    
    var imdbId: String {
        movie.imdbId
    }
    
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
    
    var year: String {
        movie.year
    }
}
