//
//  HomeProtocol.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: AnyObject{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func fetchingHome()
    func showDetailMovieController(navigationController: UINavigationController, movieId: Int)
}

protocol PresenterToViewProtocol: AnyObject{
    func showUpcomingMovies(data: [UpcomingMoviesModel]?)
    func showPopularMoviesData(data: [UpcomingMoviesModel]?)
    func showGenreMovie(data: [MovieGenresModel]?)
    func showError(error: String)
    func isLoading(isLoading: Bool)
}

protocol PresenterToRouterProtocol: AnyObject{
    static func createModule()-> HomeViewController
    func showDetailMovieController(navigationController: UINavigationController, movieId: Int)
}

protocol PresenterToInteractorProtocol: AnyObject{
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchingHome()
}

protocol InteractorToPresenterProtocol: AnyObject{
    func fetchedUpcomingMoviesSuccess(data: [UpcomingMoviesModel]?)
    func showPopularMoviesData(data: [UpcomingMoviesModel]?)
    func showGenreMovie(data: [MovieGenresModel]?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}
