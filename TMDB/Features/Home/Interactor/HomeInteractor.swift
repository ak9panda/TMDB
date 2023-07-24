//
//  HomeInteractor.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import Foundation
import RxSwift

final class HomeInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    private let service: NetworkManager
    private let disposeBag = DisposeBag()
    
    init(service: NetworkManager = NetworkManager()) {
        self.service = service
    }
    
    func fetchingHome() {
        Observable.zip(service.fetchUpcomingMovie().asObservable(),
                       service.fetchPopularMovie().asObservable(),
                       service.fetchGenreMovie().asObservable())
        .observe(on: MainScheduler.instance)
        .subscribe(onNext: ({ (response) in
            let (upcomingResponse, popularResponse, genreResponse) = response
            self.upcomingMovieResponse(response: upcomingResponse)
            self.popularMovieResponse(response: popularResponse)
            self.genreMovieResponse(response: genreResponse)
            self.presenter?.isLoading(isLoading: false)
        }), onError: ({(error) in
            guard let errorValue = error as? APIError else { return }
            self.presenter?.fetchFailed(error: errorValue.message)
            self.presenter?.isLoading(isLoading: false)
        })).disposed(by: disposeBag)
    }
    
    private func upcomingMovieResponse(response: UpComingMoviesResponse?) {
        self.presenter?.fetchedUpcomingMoviesSuccess(data: response?.results)
    }
    
    private func popularMovieResponse(response: UpComingMoviesResponse?) {
        self.presenter?.showPopularMoviesData(data: response?.results)
    }
    
    private func genreMovieResponse(response: MovieGenresResponse?) {
        self.presenter?.showGenreMovie(data: response?.genres)
    }
}
