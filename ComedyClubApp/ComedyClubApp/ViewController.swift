//
//  ViewController.swift
//  ComedyClubApp
//
//  Created by Berkay Kuzu on 30.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Comedy Club 🎭"
        label.font = UIFont.systemFont(ofSize: 40)
        label.backgroundColor = .purple
        label.textColor = .white
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    private var upcomingLabel: UILabel = {
        let label = UILabel()
        label.text = "Upcomings🔮"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .purple
        label.textAlignment = .center
        return label
    }()
    
    private var ticketInfo: UILabel = {
        let label = UILabel()
        label.text = "Ticket Information🎫"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .purple
        label.textAlignment = .center
        return label
    }()
    
    
    private var upcomingsTitleLabel1: UILabel = {
        let label = UILabel()
        label.text = "Upcoming 1 📽️"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private var upcomingsTitleLabel2: UILabel = {
        let label = UILabel()
        label.text = "Upcoming 2 📽️"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private var upcomingsTitleLabel3: UILabel = {
        let label = UILabel()
        label.text = "Upcoming 3 📽️"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private var enfantTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "👶🏻 Enfant Title Price: 5$"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private var adultTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "👨🏻 Adult Title Price: 10$"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "comedyClub.jpg")
        return imageView
    }()
    
    private let imageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "upcoming1.jpg")
        return imageView
    }()
    
    private let imageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "upcoming2.jpg")
        return imageView
    }()
    
    private let imageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "upcoming3.jpg")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        applyConstraints()
        addSubview()
        addImageStackView()
    }

    private func addSubview() {
        view.addSubview(appNameLabel)
        view.addSubview(iconImageView)
        view.addSubview(upcomingLabel)
        view.addSubview(imageStackView)
        view.addSubview(upcomingsTitleLabel1)
        view.addSubview(upcomingsTitleLabel2)
        view.addSubview(upcomingsTitleLabel3)
        view.addSubview(ticketInfo)
        view.addSubview(adultTitleLabel)
        view.addSubview(enfantTitleLabel)
    }
    
    private func addImageStackView() {
        imageStackView.addArrangedSubview(imageView1)
        imageStackView.addArrangedSubview(imageView2)
        imageStackView.addArrangedSubview(imageView3)
    }

    private func applyConstraints() {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        appNameLabel.frame = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.1, width: screenWidth * 0.8, height: screenHeight * 0.1)
        iconImageView.frame = CGRect(x: CGFloat(Int(screenWidth * 0.1)), y: screenHeight * 0.2, width: screenWidth * 0.8, height: screenHeight * 0.3)
        upcomingLabel.frame = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.48, width: screenWidth * 0.8, height: screenHeight * 0.1)
        imageStackView.frame = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.6, width: screenWidth * 0.8, height: screenHeight * 0.1)
        upcomingsTitleLabel1.frame = CGRect(x: screenWidth * 0, y: screenHeight * 0.68, width: screenWidth * 0.4, height: screenHeight * 0.1)
        upcomingsTitleLabel2.frame = CGRect(x: screenWidth * 0, y: screenHeight * 0.72, width: screenWidth * 0.4, height: screenHeight * 0.1)
        upcomingsTitleLabel3.frame = CGRect(x: screenWidth * 0, y: screenHeight * 0.76, width: screenWidth * 0.4, height: screenHeight * 0.1)
        ticketInfo.frame = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.81, width: screenWidth * 0.8, height: screenHeight * 0.1)
        enfantTitleLabel.frame = CGRect(x: screenWidth * 0, y: screenHeight * 0.86, width: screenWidth * 0.6, height: screenHeight * 0.1)
        adultTitleLabel.frame = CGRect(x: screenWidth * 0, y: screenHeight * 0.9, width: screenWidth * 0.6, height: screenHeight * 0.1)
    }
}

