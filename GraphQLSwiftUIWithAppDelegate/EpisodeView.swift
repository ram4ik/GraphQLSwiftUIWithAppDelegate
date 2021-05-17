//
//  EpisodeView.swift
//  GraphQLSwiftUIWithAppDelegate
//
//  Created by Ramill Ibragimov on 17.05.2021.
//

import SwiftUI

struct EpisodeView: View {
    let episodeId: String
    @ObservedObject var viewModel = EpisodeViewModel()
    
    var body: some View {
        VStack {
            
            if viewModel.state == .loading {
                Spinner(style: .large)
            } else if viewModel.state == .error {
                Text("Error.")
            } else if viewModel.state == .complete {
                Form {
                    Section(header: Text("Details")) {
                        Text(viewModel.episode.air_date ?? "n/a")
                    }
                    Section(header: Text("Characters")) {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.episode.characters ?? [], id: \.id) { character in
                                    VStack {
                                        RemoteImage(url: character.image)
                                            .frame(width: 120, height: 120)
                                            .padding()
                                        Text(character.name)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(viewModel.episode.name), displayMode: .inline)
        .onAppear {
            viewModel.setup(id: episodeId)
        }
    }
}
