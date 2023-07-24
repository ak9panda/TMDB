//
//  MovieDetailPresenter.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import Foundation
import UIKit

class MovieDetailPresenter: DetailViewToPresenterProcol {
    var view: DetailPresenterToViewProtocol?
    
    var interactor: DetailPresenterToInteractorProtocol?
    
    var router: DetailPresenterToRouterProtocol?
    
    func startFechingDetailMovie(id: Int) {
        interactor?.startFechingDetailMovie(id: id)
    }
}


extension MovieDetailPresenter: DetailInteractorToPresenterProtocol {
    func successLoadDetail(data: DetailMoviesResponse?) {
        view?.successLoadDetail(data: data)
    }
    
    func fetchFailed(error: String) {
        // to do
    }
    
    func isLoading(isLoading: Bool) {
        // to do
    }
    
    
}
