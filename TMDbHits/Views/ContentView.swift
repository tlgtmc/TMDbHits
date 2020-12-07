//
//  ContentView.swift
//  TMDbHits
//
//  Created by Tolga Atmaca on 4.12.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var apiCall = ApiCall()
    
    @State var searchText: String = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                SearchBar(text: $searchText).padding(10)
                
                if self.apiCall.loading {
                    ProgressView()
                }
                
                List(apiCall.movieList.filter({ searchText.isEmpty ? true : (
                    $0.title!.uppercased().contains(searchText.uppercased()) ||
                    $0.genres!.joined(separator: "-").uppercased().contains(searchText.uppercased())
                )
                })) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        VStack{
                            Text(movie.title ?? "").bold().foregroundColor(.black).font(Font.custom("Caveat-Bold", size: 32))
                            Text(movie.overview ?? "").italic().foregroundColor(.gray).font(Font.custom("Caveat-Regular", size: 24))
                        }
                    }.foregroundColor(.white)
                }.foregroundColor(.white)
                
            }
            .navigationBarTitle("Movie List")
            
        }
        .onAppear{
            self.apiCall.getPopularMovies()
            UITableViewCell.appearance().selectionStyle = .none
            
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
