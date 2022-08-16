//
//  SearchPresenter.swift
//  iMusic
//
//  Created by Ivan White on 13.08.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
    func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
    weak var viewController: SearchDisplayLogic?
    
    func presentData(response: Search.Model.Response.ResponseType) {
        
        switch response {
            
        case .presentTracks(let searchResponse):
            let cells = searchResponse?.results.map({ track in
                cellViewModel(from: track)
            }) ?? []
            // выше мы получили ячейки и подготовили их
            // дальше мы их передаем vc
            let searchViewModel = SearchViewModel.init(cells: cells)
            viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks(searchViewModel: searchViewModel))
            
        case .presentFooterView:
            viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayFooterView)
        }
    }
    // Тут мы пишем функцию преобразования из track в cellViewModel
    // Эта функция и есть тот самый холст где мы будем подготавливать данные так или иначе в зависимости от запроса
    private func cellViewModel(from track: Track) -> SearchViewModel.Cell {
        return SearchViewModel.Cell.init(iconUrlString: track.artworkUrl100,
                                         trackName: track.trackName,
                                         collectionName: track.collectionName ?? "",
                                         artistName: track.artistName,
                                         previewUrl: track.previewUrl)
    }
}
