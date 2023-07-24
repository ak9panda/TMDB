//
//  MovieDetailProtocol.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import Foundation
import UIKit

protocol DetailViewToPresenterProcol: AnyObject {
    var view: DetailPresenterToViewProtocol? {get set}
    var interactor: DetailPresenterToInteractorProtocol? {get set}
    var router: DetailPresenterToRouterProtocol? {get set}
    func startFechingDetailMovie(id: Int)
}

protocol DetailPresenterToViewProtocol: AnyObject {
    func successLoadDetail(data: DetailMoviesResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}

protocol DetailPresenterToRouterProtocol: AnyObject {
    static func createModule(movieId: Int)-> MovieDetailViewController
}

protocol DetailPresenterToInteractorProtocol: AnyObject {
    var presenter: DetailInteractorToPresenterProtocol? {get set}
    func startFechingDetailMovie(id: Int)
}

protocol DetailInteractorToPresenterProtocol: AnyObject {
    func successLoadDetail(data: DetailMoviesResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}
