//
//  TrackDetailView.swift
//  iMusic
//
//  Created by Ivan White on 16.08.2022.
//

import UIKit

class TrackDetailView: UIView {
    
    private let buttonHide: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        // Две строки ниже делают кортинку во весь размер кнопки
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = .lightGray
        return button
    }()
    
    private let generalImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var sliderSong: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 1
        slider.maximumValue = 12
        slider.minimumTrackTintColor = .none
        slider.maximumTrackTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        slider.addTarget(self, action: #selector(slider_func), for: .valueChanged)
        return slider
    }()
    
    private let textTimeStart: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.6919150949, green: 0.7063220143, blue: 0.7199969292, alpha: 1)
        return label
    }()
    
    private let textTimeDown: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.6919150949, green: 0.7063220143, blue: 0.7199969292, alpha: 1)
        return label
    }()
    
    private let textNameSong: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.6919150949, green: 0.7063220143, blue: 0.7199969292, alpha: 1)
        return label
    }()
    
    private let textNameAuthor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.6919150949, green: 0.7063220143, blue: 0.7199969292, alpha: 1)
        return label
    }()
    
    private let buttonBack: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonPlay: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonRight: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let imageSoundLess: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var sliderSound: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 1
        slider.maximumValue = 12
        slider.minimumTrackTintColor = .none
        slider.maximumTrackTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        slider.addTarget(self, action: #selector(slider_func), for: .valueChanged)
        return slider
    }()
    
    private let imageSoundMore: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.addSubview(buttonHide)
        self.addSubview(generalImage)
        self.addSubview(sliderSong)
        self.addSubview(textTimeStart)
        self.addSubview(textTimeDown)
        self.addSubview(textNameSong)
        self.addSubview(textNameAuthor)
        self.addSubview(buttonBack)
        self.addSubview(buttonPlay)
        self.addSubview(buttonRight)
        self.addSubview(imageSoundLess)
        self.addSubview(sliderSound)
        self.addSubview(imageSoundMore)
    }
    
    @objc private func slider_func() {
        ///
    }
}

extension TrackDetailView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            buttonHide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            buttonHide.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonHide.heightAnchor.constraint(equalToConstant: 45),
            buttonHide.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
