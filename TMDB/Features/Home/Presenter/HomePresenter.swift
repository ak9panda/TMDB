//
//  HomePresenter.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import Foundation
import RxSwift

class HomePresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func fetchingHome() {
        interactor?.fetchingHome()
    }
    
    func showDetailMovieController(navigationController: UINavigationController, movieId: Int) {
        router?.showDetailMovieController(navigationController: navigationController, movieId: movieId)
    }
}


extension HomePresenter: InteractorToPresenterProtocol {
    func fetchedUpcomingMoviesSuccess(data: [UpcomingMoviesModel]?) {
        view?.showUpcomingMovies(data: data)
    }
    
    func showPopularMoviesData(data: [UpcomingMoviesModel]?) {
        view?.showPopularMoviesData(data: data)
    }
    
    func showGenreMovie(data: [MovieGenresModel]?) {
        view?.showGenreMovie(data: data)
    }
    
    func fetchFailed(error: String) {
        
    }
    
    func isLoading(isLoading: Bool) {
        
    }
}
