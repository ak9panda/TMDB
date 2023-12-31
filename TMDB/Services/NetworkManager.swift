//
//  NetworkManager.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import Foundation
import RxSwift
import Moya
import RxCocoa

protocol FetchApiServices {
    func fetchGenreMovie() -> Single<MovieGenresResponse?>
    func fetchUpcomingMovie() -> Single<UpComingMoviesResponse?>
    func fetchPlayingNowMovie() -> Single<UpComingMoviesResponse?>
    func fetchPopularMovie() -> Single<UpComingMoviesResponse?>
    func fetchDetailMovie(id: Int) ->  Single<DetailMoviesResponse?>
//    func fetchMoviesPaging(page: Int, enumData: HomeEnumSection) -> Single<UpComingMoviesResponse?>
    func fetchMoviesByGenre(genre: String) ->  Single<UpComingMoviesResponse?>
    func fetchMoviesByGenrePaging(page: Int, genre: String) -> Single<UpComingMoviesResponse?>
}

final class NetworkManager: FetchApiServices {
    
    private let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin()])
    
    func request<T: Codable>(networkService: NetworkService) -> Single<T?> {
        if !Reachability.isConnectedToNetwork() {
            return Single.error(APIError(with: .internetConnection, message: "No Internet Connection"))
        }
        
        return provider
            .rx.request(networkService)
            .observe(on: ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1)))
            .catch { error -> PrimitiveSequence<SingleTrait, Response> in
                return Single.error(APIError(with: .unknown, message: error.localizedDescription))
            }.flatMap {json -> Single<T?> in
                if json.statusCode >= 200 && json.statusCode <= 300 {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    if let response = try? decoder.decode(T.self, from: json.data) {
                        return Single.just(response)
                    }
                } else {
                    let error = APIError(with: .internalServerError, message: "Internal Server Error")
                    return Single.error(error)
                }
                let error = APIError(with: .unknown, message: "Failed to parse response")
                return Single.error(error)
            }
    }
    
    func fetchGenreMovie() -> Single<MovieGenresResponse?> {
        return request(networkService: .genreMovie)
    }
    
    func fetchUpcomingMovie() -> Single<UpComingMoviesResponse?> {
        return request(networkService: .upComingMovie)
    }
    
    func fetchPlayingNowMovie() -> Single<UpComingMoviesResponse?> {
        return request(networkService: .nowPlaying)
    }
    
    func fetchPopularMovie() -> Single<UpComingMoviesResponse?>{
         return request(networkService: .popularMovie)
    }
    
//    func fetchMoviesPaging(page: Int, enumData: HomeEnumSection) -> Single<UpComingMoviesResponse?> {
//        return request(networkService: enumData == .nowPlaying ? .nowPlayingMoviePaging(page: page) : enumData == .trendingMovie ? .trendingMoviePaging(page: page) : .upComingMoviePaging(page : page))
//    }
    
    func fetchDetailMovie(id: Int) -> Single<DetailMoviesResponse?> {
        return request(networkService: .detailMovie(id: id))
    }
    
    func fetchMoviesByGenre(genre: String) -> Single<UpComingMoviesResponse?> {
        return request(networkService: .movieByGenres(genre: genre))
    }
    
    func fetchMoviesByGenrePaging(page: Int, genre: String) -> Single<UpComingMoviesResponse?> {
        return request(networkService: .movieByGenresPaging(genre: genre, page: page))
    }
}
