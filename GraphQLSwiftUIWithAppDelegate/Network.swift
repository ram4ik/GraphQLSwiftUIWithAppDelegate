//
//  Network.swift
//  GraphQLSwiftUIWithAppDelegate
//
//  Created by Ramill Ibragimov on 17.05.2021.
//

import Apollo

struct Network {
    static var shared = Network()
    
    private init() {}
    
    private(set) lazy var apollo: ApolloClient = {
        let url = URL(string: "https://rickandmortyapi.com/graphql")!
        return ApolloClient(url: url)
    }()
}
