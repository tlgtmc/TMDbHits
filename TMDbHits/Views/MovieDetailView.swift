//
//  MovieDetailView.swift
//  TMDbHits
//
//  Created by Tolga Atmaca on 5.12.2020.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie : Movie?
    
    @ObservedObject var apiCall = ApiCall()
    
    
    var body: some View {
        ZStack {
            VStack {
                
                HStack {
                    RemoteImageView(url: Commons.URL_IMAGE_SERVER + (movie?.poster_path ?? ""))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                    
                    ScrollView {
                        Text(movie?.overview ?? "").font(Font.custom("Caveat-Regular", size: 24)).foregroundColor(.gray)
                    }.padding(.top, 10)
                }
                
                Section {
                    HStack {
                        Text("Genres:").font(Font.custom("Caveat-Bold", size: 32)).foregroundColor(.gray)
                        Text(movie?.genres?.joined(separator: ", ") ?? "").font(Font.custom("Caveat-Regular", size: 24)).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Popularity:").font(Font.custom("Caveat-Bold", size: 32)).foregroundColor(.gray)
                        Text(String(movie?.popularity ?? 0)).font(Font.custom("Caveat-Regular", size: 24)).foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("Vote Average:").font(Font.custom("Caveat-Bold", size: 32)).foregroundColor(.gray)
                        Text(String(movie?.vote_average ?? 0)).font(Font.custom("Caveat-Regular", size: 24)).foregroundColor(.gray)
                    }
                }
                Text("Cast").font(Font.custom("Caveat-Bold", size: 32)).foregroundColor(.gray)
                
                if self.apiCall.loading {
                    ProgressView()
                }
                List(apiCall.credits.cast ?? []) { cast in
                    NavigationLink(destination: CastDetailView(cast: cast)) {
                        VStack{
                            Text(cast.name ?? "").bold().font(Font.custom("Caveat-Regular", size: 24)).foregroundColor(.gray)
                        }
                    }
                }
            }
        }.navigationBarTitle(movie?.title ?? "ops", displayMode: .inline).onAppear {
            self.apiCall.getCredits(id: String(movie?.id ?? 0))
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieDetailView(movie: nil)
    }
}
