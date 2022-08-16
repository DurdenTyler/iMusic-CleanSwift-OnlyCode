//
//  SearchInteractor.swift
//  iMusic
//
//  Created by Ivan White on 13.08.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
    func makeRequest(request: Search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {
    
    var presenter: SearchPresentationLogic?
    var service: SearchService?
    
    let networkService = NetworkService()
    
    func makeRequest(request: Search.Model.Request.RequestType) {
        if service == nil {
            service = SearchService()
        }
        switch request {
            
        case .getTracks(let searchText):
            presenter?.presentData(response: Search.Model.Response.ResponseType.presentFooterView)
            
            networkService.fetchTracks(searchText: searchText) { [weak self] SearchResponse in
                self?.presenter?.presentData(response: Search.Model.Response.ResponseType.presentTracks(searchResponse: SearchResponse))
            }
        }
    }
    
}
