//
//  ViewController.swift
//  HomeworkFirstProject
//
//  Created by Ismayil Ismayilov on 17.04.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let arrowImage = UIImageView(image: UIImage(named: "arrow"))
    let fourDotsImage = UIImageView(image: UIImage(named: "dots"))
    let listImage = UIImageView(image: UIImage(named: "list"))
    
   
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Recently Booked"
        label.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.bold)
        label.textColor = .darkText
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 16
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
        
        
        self.view.addSubview(headerLabel)
        self.view.addSubview(arrowImage)
        self.view.addSubview(fourDotsImage)
        self.view.addSubview(listImage)
        self.view.addSubview(scrollView)
        
        self.headerLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(8)
            make.left.equalTo(self.arrowImage.snp.right).offset(16)
        }
        
        self.arrowImage.snp.makeConstraints { make in
//            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(43)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(20)
            make.centerY.equalTo(self.headerLabel.snp.centerY)
        }
        
        self.listImage.snp.makeConstraints { make in
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-65)
            make.centerY.equalTo(self.headerLabel.snp.centerY)
            make.width.height.equalTo(30)
        }
        
        self.fourDotsImage.snp.makeConstraints { make in
            make.left.equalTo(self.listImage.snp.right).offset(16)
            make.centerY.equalTo(self.headerLabel.snp.centerY)
            make.width.height.equalTo(30)
        }
        
        self.scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.headerLabel.snp.bottom).offset(16)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        self.scrollView.addSubview(stackView)
        
        self.stackView.snp.makeConstraints { make in
            make.top.equalTo(self.scrollView.contentLayoutGuide.snp.top).offset(16)
            make.left.equalTo(self.scrollView.contentLayoutGuide.snp.left).offset(16)
            make.bottom.equalTo(self.scrollView.contentLayoutGuide.snp.bottom).offset(-16)
            make.centerX.equalTo(self.scrollView.snp.centerX)
        }
        
        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "amsterdam"), hotelName: "Cozy Place", hotelLocation: "Amsterdam, Netherlands", price: 35, rating: 4.8, reviews: 4378, saveIconType: UIImage(named: "filledSave")))
        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "istanbul"), hotelName: "Istanbul Sea View", hotelLocation: "Istanbul, Turkey", price: 40, rating: 4.6, reviews: 5843, saveIconType: UIImage(named: "unfilledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "florence"), hotelName: "Ancient Walls", hotelLocation: "Florence, Italy", price: 38, rating: 3.8, reviews: 2589, saveIconType: UIImage(named: "filledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "amsterdam"), hotelName: "Cinqua Terre", hotelLocation: "Portofino, Italy", price: 52, rating: 4.4, reviews: 2432, saveIconType: UIImage(named: "unfilledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "genoa"), hotelName: "Palazzo Genoa", hotelLocation: "Genoa, Italy", price: 25, rating: 3.6, reviews: 3865, saveIconType: UIImage(named: "unfilledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "nice"), hotelName: "All Best In One", hotelLocation: "Nice, France", price: 59, rating: 4.5, reviews: 4326, saveIconType: UIImage(named: "filledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "perouges"), hotelName: "History, Mistery", hotelLocation: "Perouges, France", price: 42, rating: 4.4, reviews: 1076, saveIconType: UIImage(named: "unfilledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "lyon"), hotelName: "Best French Here", hotelLocation: "Lyon, France", price: 24, rating: 3.9, reviews: 2678, saveIconType: UIImage(named: "unfilledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "brussels"), hotelName: "Center of Europe", hotelLocation: "Brussels, Belgium", price: 26, rating: 4.7, reviews: 3625, saveIconType: UIImage(named: "unfilledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "valencia"), hotelName: "OffShore Hotel", hotelLocation: "Valencia, Spain", price: 26, rating: 4.1, reviews: 2312, saveIconType: UIImage(named: "unfilledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "venice"), hotelName: "Palazzo Venezzia", hotelLocation: "Venice, Italy", price: 44, rating: 4.6, reviews: 3654, saveIconType: UIImage(named: "filledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "verona"), hotelName: "Verona Square", hotelLocation: "Verona, Italy", price: 26, rating: 4.7, reviews: 2745, saveIconType: UIImage(named: "unfilledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "milan"), hotelName: "MFW", hotelLocation: "Milan, Italy", price: 38, rating: 4.0, reviews: 3878, saveIconType: UIImage(named: "filledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "turin"), hotelName: "Home Place", hotelLocation: "Turin, Italy", price: 24, rating: 4.9, reviews: 2376, saveIconType: UIImage(named: "filledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "barcelona"), hotelName: "Con Altura", hotelLocation: "Barcelona, Spain", price: 29, rating: 4.8, reviews: 5367, saveIconType: UIImage(named: "filledSave")))

        self.stackView.addArrangedSubview(self.getView(hotelImage: UIImage(named: "paris"), hotelName: "Bienvenue", hotelLocation: "Paris, France", price: 39, rating: 4.5, reviews: 5367, saveIconType: UIImage(named: "unfilledSave")))

    }
    
    func getView(hotelImage: UIImage?, hotelName: String, hotelLocation: String, price: Int, rating: Double, reviews: Int, saveIconType: UIImage?) -> UIView {
        let view = UIView()
//        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        
        let imageHotel = UIImageView(image: hotelImage)
        imageHotel.layer.cornerRadius = 18
        imageHotel.clipsToBounds = true
        
        let nameLabel = UILabel()
        nameLabel.text = hotelName
        nameLabel.textColor = .darkText
        nameLabel.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        nameLabel.numberOfLines = 0
        
        let locationLabel = UILabel()
        locationLabel.text = hotelLocation
        locationLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        locationLabel.textColor = .lightGray
        
        let priceLabel = UILabel()
        priceLabel.text = "$\(price)"
        priceLabel.textColor = .systemGreen
        priceLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        
        let nightLabel = UILabel()
        nightLabel.text = "/night"
        nightLabel.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.thin)
        nightLabel.textColor = .darkGray
        
        let ratingLabel = UILabel()
        ratingLabel.text = "\(rating)"
        ratingLabel.textColor = .systemGreen
        ratingLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        
        let reviewLabel = UILabel()
        reviewLabel.text = "(\(reviews) reviews)"
        reviewLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin)
        reviewLabel.textColor = .darkGray
        
        let locationIcon = UIImageView(image: UIImage(named: "location"))
        
        let starIcon = UIImageView(image: UIImage(named: "star"))
        
        let saveIcon = UIImageView(image: saveIconType)
        
        
        view.addSubview(imageHotel)
        view.addSubview(nameLabel)
        view.addSubview(locationLabel)
        view.addSubview(priceLabel)
        view.addSubview(nightLabel)
        view.addSubview(ratingLabel)
        view.addSubview(reviewLabel)
        view.addSubview(locationIcon)
        view.addSubview(starIcon)
        view.addSubview(saveIcon)
        
        view.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        imageHotel.snp.makeConstraints { make in
            make.width.height.equalTo(110)
//            make.top.equalTo(view.snp.top).offset(8)
            make.left.equalTo(view.snp.left).offset(16)
            make.centerY.equalTo(view.snp.centerY)
//            make.bottom.equalTo(view.snp.bottom).offset(-8)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(26)
            make.left.equalTo(imageHotel.snp.right).offset(8)
            make.width.equalTo(140)
        }
        
        locationIcon.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
            make.left.equalTo(imageHotel.snp.right).offset(8)
            make.centerY.equalTo(locationLabel.snp.centerY)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
            make.left.equalTo(locationIcon.snp.right).offset(2)
        }
        
        starIcon.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(16)
            make.left.equalTo(imageHotel.snp.right).offset(8)
            make.centerY.equalTo(ratingLabel.snp.centerY)
            make.width.height.equalTo(15)
        }
        
        reviewLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(9)
            make.left.equalTo(starIcon.snp.right).offset(35)
            make.centerY.equalTo(ratingLabel.snp.centerY)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(16)
            make.left.equalTo(starIcon.snp.right).offset(2)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(16)
            make.right.equalTo(view.snp.right).offset(-8)
            make.centerY.equalTo(nameLabel.snp.centerY)
        }
        
        nightLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(2)
            make.right.equalTo(view.snp.right).offset(-8)
        }
        
        saveIcon.snp.makeConstraints { make in
            make.top.equalTo(nightLabel.snp.bottom).offset(12)
            make.right.equalTo(view.snp.right).offset(-8)
        }
        
        return view
    }
}

