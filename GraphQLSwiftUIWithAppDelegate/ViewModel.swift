//
//  ViewModel.swift
//  GraphQLSwiftUIWithAppDelegate
//
//  Created by Ramill Ibragimov on 17.05.2021.
//

import Foundation

class EpisodesViewModel: ObservableObject {
    let repo = Repository()
    
    @Published var state: ViewStatus = .none
    @Published var episodes = [Episode]()
    
    init() {
        setup()
    }
    
    func setup() {
        state = .loading
        
        repo.getEpisodes { episodes in
            guard let episodes = episodes else {
                self.state = .error
                return
            }
            
            self.episodes = episodes
            self.state = .complete
        }
    }
}

class EpisodeViewModel: ObservableObject {
    let repo = Repository()
    
    @Published var state: ViewStatus = .none
    @Published var episode = Episode.example

    func setup(id: String) {
        state = .loading
        
        repo.getEpisode(id: id) { episode in
            guard let episode = episode else {
                self.state = .error
                return
            }
            
            self.episode = episode
            self.state = .complete
        }
    }
}
