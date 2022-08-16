//
//  SearchViewController.swift
//  iMusic
//
//  Created by Ivan White on 01.08.2022.
//

import UIKit
import Alamofire

struct TrackModel {
    let trackName: String
    let artistName: String
}

class SearchMusicViewController: UITableViewController {
    
    private var timer: Timer?
    
    let networkService = NetworkService()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var tracks = [Track]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupSearchBar()
    }
    
    
    private func setupViews() {
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let track = tracks[indexPath.row]
        
        var content = cell.defaultContentConfiguration()

        content.image = UIImage(named: "billie")
        
        content.text = "\(track.trackName)\n\(track.artistName)"

        cell.contentConfiguration = content
        
        return cell
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}


extension SearchMusicViewController: UISearchBarDelegate {
    // Реализуем поиск, то есть если мы что то вводим то происходит поиск
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // что бы данные не подгружались по каждому символупоэтому делаем время на ввод пользователя слова для поиска
        // что б меньше ресурсов тратилось
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.networkService.fetchTracks(searchText: searchText) { [weak self] searchResults in
                self?.tracks = searchResults?.results ?? []
                self?.tableView.reloadData()
            }

        })
    }
}
