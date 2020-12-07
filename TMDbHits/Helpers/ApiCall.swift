//
//  ApiCall.swift
//  TMDbHits
//
//  Created by Tolga Atmaca on 4.12.2020.
//

import Alamofire
import ObjectMapper

public class ApiCall: ApiBase, ObservableObject {
    
    @Published var movieList = [Movie]()
    @Published var genreList = [Genres]()
    @Published var credits = Credits()
    @Published var loading = true
    
    public func getPopularMovies() {
        
        self.loading = true
        getGenres()
        
        fetchPopularMovies { apiResponse in
            switch(apiResponse.status) {
            case .success:
                DispatchQueue.main.async {
                    self.movieList = apiResponse.responseObject?.results ?? []
                    self.setGenres()
                    self.loading = false
                }
            case .failure:
                // TODO: Failure situation
                self.loading = false
                print("failed to get the movies!!!!!")
            }
        }
    }
    
    func fetchPopularMovies(completion: @escaping (ApiResponse<MovieResult>) -> Void) {
        super.genericCall(MovieResult.self, method: .get, URL: Commons.URL_MOVIE_POPULAR, parameters: [:]) {
            response in completion(response)
        }
    }
    
    func setGenres() {
        if genreList.count > 0 {
            for index in movieList.indices {
                let genres = genreList.filter({(movieList[index].genre_ids?.contains($0.id!))!})
                movieList[index].genres = genres.map{ $0.name! }
            }
        }
    }
    
    public func getCredits(id: String) {
        loading = true
        fetchCredits(id: id) { apiResponse in
            switch(apiResponse.status) {
            case .success:
                DispatchQueue.main.async {
                    self.credits = apiResponse.responseObject!
                    self.loading = false
                }
            case .failure:
                // TODO: Failure situation
                self.loading = false
                print("failed to get the credits!!!!!")
            }
        }
    }
    
    func fetchCredits(id: String, completion: @escaping (ApiResponse<Credits>) -> Void) {
        super.genericCall(Credits.self, method: .get, URL: Commons.getCreditUrl(id: id), parameters: [:]) {
            response in completion(response)
        }
    }
    
    public func getGenres() {
        fetchGenres() { apiResponse in
            switch(apiResponse.status) {
            case .success:
                DispatchQueue.main.async {
                    self.genreList = apiResponse.responseObject!.genres ?? []
                }
            case .failure:
                // TODO: Failure situation
                print("failed to get the genres!!!!!")
            }
        }
    }
    
    
    func fetchGenres(completion: @escaping (ApiResponse<GenreResult>) -> Void) {
        super.genericCall(GenreResult.self, method: .get, URL: Commons.URL_MOVIE_GENRE, parameters: [:]) {
            response in completion(response)
        }
    }
}
