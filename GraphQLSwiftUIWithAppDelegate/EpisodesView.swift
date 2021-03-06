//
//  EpisodesView.swift
//  GraphQLSwiftUIWithAppDelegate
//
//  Created by Ramill Ibragimov on 17.05.2021.
//

import SwiftUI

struct EpisodesView: View {
    @ObservedObject var viewModel = EpisodesViewModel()
    
    var body: some View {
        if viewModel.state == .loading {
            Spinner(style: .large)
        } else if viewModel.state == .error {
            Text("Error.")
        } else if viewModel.state == .complete {
            NavigationView {
                List {
                    ForEach(viewModel.episodes, id: \.id) { episode in
                        NavigationLink(destination: EpisodeView(episodeId: episode.id)) {
                            HStack {
                                Text(episode.name)
                                Spacer()
                                Text(episode.episode)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                        }
                    }
                }
                .navigationBarTitle("R&M Episodes")
            }
        }
    }
}
