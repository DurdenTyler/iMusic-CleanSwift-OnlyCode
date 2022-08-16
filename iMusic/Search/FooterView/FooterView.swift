//
//  FooterView.swift
//  iMusic
//
//  Created by Ivan White on 16.08.2022.
//

import UIKit


class FooterView: UIView {
    
    private let loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.hidesWhenStopped = true // что бы индикатор пропадал когда он останавливается
        return loader
    }()
    
    private let text_Loading: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.6919150949, green: 0.7063220143, blue: 0.7199969292, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(text_Loading)
        self.addSubview(loader)
    }
    
    func showLoader() {
        loader.startAnimating()
        text_Loading.text = "LOADING"
    }
    
    func hideLoader() {
        loader.stopAnimating()
        text_Loading.text = ""
    }
    
    
}

extension FooterView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            loader.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            loader.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            text_Loading.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            text_Loading.topAnchor.constraint(equalTo: loader.bottomAnchor, constant: 8)
        ])
    }
}
