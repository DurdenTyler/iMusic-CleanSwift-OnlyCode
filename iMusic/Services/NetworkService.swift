//
//  NetworkService.swift
//  iMusic
//
//  Created by Ivan White on 11.08.2022.
//

import UIKit
import Alamofire

class NetworkService {
    // пишем функцию что будет запрашивать из интернета треки
    
    func fetchTracks(searchText: String, competion: @escaping (SearchResponse?) -> Void) {
        let url = "https://itunes.apple.com/search?term=\(searchText)"
        let parameters = ["term":"\(searchText)", "limit":"10", "media":"music"]
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { dataResponse in
            if let error = dataResponse.error {
                print("Error received requesting data: \(error.localizedDescription)")
                competion(nil)
                return
            } else {
                guard let data = dataResponse.data else { return }
                // создаем декодер
                let decoder = JSONDecoder()
                // теперь если я хочу декодировать то я обязан это делать в блоке do catch
                do {
                    // тут мы пытаемся дикодировать данные
                    let objects = try decoder.decode(SearchResponse.self, from: data)
                    competion(objects)
                } catch let jsonError {
                    // а тут у нас если пришла ошибка то мы её должны обработать
                    print("Failed to decode JSON", jsonError)
                    competion(nil)
                }
                //let someString = String(data: data, encoding: .utf8)
                //print(someString ?? "")
            }
        }
    }
}
