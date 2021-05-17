//
//  Repository.swift
//  GraphQLSwiftUIWithAppDelegate
//
//  Created by Ramill Ibragimov on 17.05.2021.
//

import Foundation

class Repository {
    
    func getEpisodes(completion: @escaping ([Episode]?) -> ()) {
        Network.shared.apollo.fetch(query: GetEpisodesQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            case .success(let data):
                let model = data.data?.episodes?.decodeMode(type: EpisodesResponse.self)
                completion(model?.results)
            }
        }
    }
    
    func getEpisode(id: String, completion: @escaping (Episode?) -> ()) {
        Network.shared.apollo.fetch(query: GetEpisodeQuery(id: id), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            case .success(let data):
                let model = data.data?.episode?.decodeMode(type: Episode.self)
                completion(model)
            }
        }
    }
}
