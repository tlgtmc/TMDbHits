//
//  Commons.swift
//  TMDbHits
//
//  Created by Tolga Atmaca on 4.12.2020.
//

public class Commons {

    static let API_KEY = "8631d637506749b86b212c75067c44cb"

    static let URL_SERVER = "https://api.themoviedb.org/3"
    static let URL_IMAGE_SERVER = "https://image.tmdb.org/t/p/w500/"
    
    static let URL_MOVIE_POPULAR = URL_SERVER + "/movie/popular?api_key=" + API_KEY + "&language=en-US&page=1"  // GET
    
    static let URL_MOVIE_CREDITS = URL_SERVER + "/movie"

    static let URL_MOVIE_GENRE = URL_SERVER + "/genre/movie/list" + URL_API_QUERY

    static let URL_API_QUERY = "?api_key=" + API_KEY + "&language=en-US"
    
    public static func getCreditUrl(id: String) -> String {
        var url = URL_MOVIE_CREDITS;
        url = url + "/" + id
        url = url + "/credits"
        url = url + URL_API_QUERY
        return url
    }

    
    public enum ApiResponse: Int {
        case failure = 0, success
    }
}
