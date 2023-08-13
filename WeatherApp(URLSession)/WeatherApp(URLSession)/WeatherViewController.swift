//
//  WeatherViewController.swift
//  WeatherApp(URLSession)
//
//  Created by Berkay Kuzu on 25.06.2023.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    
    var weatherManager = WeatherManager()
    
    private let temperatureLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillProportionally
        //stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let temperatureLabel1: UILabel = {
        let label = UILabel()
        label.text = "21"
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let temperatureLabel2: UILabel = {
        let label = UILabel()
        label.text = "°C"
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
//    private let temperatureLabel3: UILabel = {
//        let label = UILabel()
//        label.text = "C"
//        label.font = UIFont.boldSystemFont(ofSize: 50)
//        label.textColor = .black
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        return label
//    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "London"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let conditionLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.font = UIFont.italicSystemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let conditionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "sun.max")
        imageView.tintColor = .black
        //imageView.backgroundColor = .clear
        return imageView
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        //button.setTitle("Register", for: .normal)
        //button.titleLabel?.textAlignment = .center
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        //button.backgroundColor = .systemYellow
        //button.setTitleColor(.black, for: .normal)
        //button.layer.cornerRadius = 8
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Search"
        textField.textAlignment = .right
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        //textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.autocapitalizationType = .words
        textField.returnKeyType = .go
        textField.backgroundColor = .systemGray4
        //        textField.addTarget(self, action: #selector(nameTextFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view!
        configureBackgroundImage()
        addSubviews()
        addStackViews()
        applyConstraints()
        
        searchTextField.delegate = self
        weatherManager.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(conditionImageView)
        view.addSubview(temperatureLabelStackView)
        view.addSubview(temperatureLabel1)
        view.addSubview(temperatureLabel2)
//        view.addSubview(temperatureLabel3)
        view.addSubview(cityLabel)
        view.addSubview(conditionLabel)
    }
    
    private func addStackViews() {
        temperatureLabelStackView.addArrangedSubview(temperatureLabel1)
        temperatureLabelStackView.addArrangedSubview(temperatureLabel2)
//        temperatureLabelStackView.addArrangedSubview(temperatureLabel3)
    }
    
    private func applyConstraints() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-70)
        }
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        conditionImageView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
            make.width.height.equalTo(100)
        }
        temperatureLabelStackView.snp.makeConstraints { make in
            make.top.equalTo(conditionImageView.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(220)
        }
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabelStackView.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        conditionLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        temperatureLabel1.snp.makeConstraints { make in
            make.width.equalTo(150)
        }
        temperatureLabel2.snp.makeConstraints { make in
            make.width.equalTo(70)
        }
    }

    private func configureBackgroundImage() {
        //        let backgroundImage = UIImage(named: "background")
        //        view.backgroundColor = UIColor(patternImage: backgroundImage!)
        let backgroundImage = UIImage(named: "background")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.frame = view.bounds
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        
        DispatchQueue.main.async {
            self.temperatureLabel1.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.conditionLabel.text = weather.weatherCondition
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Please, enter a city name!")
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // Use searchTextField.text to get the weather for that city.
//        if let city = searchTextField.text {
//            weatherManager.fetchWeather(cityName: city)
//        }
        guard let city = searchTextField.text else {return}
        weatherManager.fetchWeather(cityName: city)
    }
    
    @objc private func searchButtonTapped() {
        searchTextField.endEditing(true)
    }

    // MARK: - UIAlertController
    
    public func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }
}

