//
//  TrackCell.swift
//  iMusic
//
//  Created by Ivan White on 15.08.2022.
//

import UIKit
import SDWebImage

// Если мы говорим что какой то класс подписан под этот протокол, то таким образом мы говорим что данный подписанный класс обязан
// реализовать все методы и свойства данного протокола
// в данном случае мы под этот протокол подпишем структуру в моделях
// и теперь значит что данная структура обязана реализовать все методы и свойства данного протокола

// Возникает вопрос зачем это все?
// Это сделано для того что бы отгородить класс TrackCell от излишней информации по ячейки
protocol TrackCellViewModelProtocol {
    var iconUrlString: String? { get }
    var trackName: String { get }
    var artistName: String { get }
    var collectionName: String { get }
}


class TrackCell: UITableViewCell {
    
    var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let text_nameSong: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Crazy"
        
        return label
    }()
    
    let text_nameArtist: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "50 Cent"
        label.textColor = #colorLiteral(red: 0.5667980909, green: 0.5676257014, blue: 0.5925744772, alpha: 1)
        
        return label
    }()
    
    let text_nameAlbum: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Get Rich or Die "
        label.textColor = #colorLiteral(red: 0.5667980909, green: 0.5676257014, blue: 0.5925744772, alpha: 1)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Это написано потому что, ячейка в tableView переиспользуется
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
    }
    
    private func setupViews() {
        backgroundColor = .clear
        self.addSubview(image)
        self.addSubview(text_nameSong)
        self.addSubview(text_nameArtist)
        self.addSubview(text_nameAlbum)
    } 
    
    private func cellConfigure(viewModel: TrackCellViewModelProtocol) {
        self.text_nameSong.text = viewModel.trackName
        self.text_nameArtist.text = viewModel.artistName
        self.text_nameAlbum.text = viewModel.collectionName
        
        guard let url = URL(string: viewModel.iconUrlString ?? "") else { return }
        self.image.sd_setImage(with: url, completed: nil)
    }
    
    func trackCellConfigure(viewModel: TrackCellViewModelProtocol) {
        cellConfigure(viewModel: viewModel)
    }
}

extension TrackCell {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 60),
            image.widthAnchor.constraint(equalToConstant: 60),
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            text_nameSong.topAnchor.constraint(equalTo: self.topAnchor, constant: 13),
            text_nameSong.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            text_nameSong.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            text_nameArtist.topAnchor.constraint(equalTo: text_nameSong.bottomAnchor, constant: 2),
            text_nameArtist.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            text_nameArtist.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            text_nameAlbum.topAnchor.constraint(equalTo: text_nameArtist.bottomAnchor, constant: 3),
            text_nameAlbum.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            text_nameAlbum.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
}
