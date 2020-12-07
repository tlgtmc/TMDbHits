//
//  CastDetailView.swift
//  TMDbHits
//
//  Created by Tolga Atmaca on 5.12.2020.
//

import SwiftUI

struct CastDetailView: View {
    
    let cast : Cast?
    
    var body: some View {
        ZStack {
            VStack {
                RemoteImageView(url: Commons.URL_IMAGE_SERVER + (cast?.profile_path ?? ""))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                
                Text(cast?.original_name ?? "").font(Font.custom("Caveat-Bold", size: 32)).foregroundColor(.gray)
                HStack {
                    Text("Character:").font(Font.custom("Caveat-Bold", size: 32)).foregroundColor(.gray)
                    Text(cast?.character ?? "").font(Font.custom("Caveat-Regular", size: 24)).foregroundColor(.gray)
                }
            }
        }
    }
}

struct CastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CastDetailView(cast: nil)
    }
}
