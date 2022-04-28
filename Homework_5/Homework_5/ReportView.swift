//
//  ReportView.swift
//  Homework_5
//
//  Created by Ismayil Ismayilov on 28.04.22.
//

import UIKit
import SnapKit

class ReportView : UIView {
    
    //MARK: UI Components
    private lazy var headerLabel : UILabel = {
       let label = UILabel()
        label.text = "Report"
        
        guard let customFont = UIFont(name: "NunitoSans-Bold", size: 27) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var view1 : UIView = {
        let view = self.settingView(hexcode: "#DCEDF9")
        return view
    }()
    
    private lazy var view2 : UIView = {
        let view = self.settingView(hexcode: "#F5E1E9")
        return view
    }()
    
    private lazy var view3 : UIView = {
        let view = self.settingView(hexcode: "#FAF0DB")
        return view
    }()
    
    private lazy var heartRateLabel : UILabel = {
        let label = self.settinglabel(text: "Heart Rate", customFont: "NunitoSans-Regular", customSize: 16, textColor: "#0E1012")
        return label
    }()
    
    private lazy var bloodGroupLabel : UILabel = {
        let label = self.settinglabel(text: "Blood Group", customFont: "NunitoSans-Regular", customSize: 16, textColor: "#0E1012")
        return label
    }()
    
    private lazy var weightLabel : UILabel = {
        let label = self.settinglabel(text: "Weight", customFont: "NunitoSans-Regular", customSize: 16, textColor: "#0E1012")
        return label
    }()
    
    private lazy var heartLabel : UILabel = {
        let label = self.settinglabel(text: "96", customFont: "NunitoSans-Bold", customSize: 60, textColor: "#0E1012")
        return label
    }()
    
    private lazy var bpmLabel : UILabel = {
        let label = self.settinglabel(text: "bpm", customFont: "NunitoSans-Regular", customSize: 28, textColor: "#0E1012")
        return label
    }()
    
    private lazy var aLabel : UILabel = {
        let label = self.settinglabel(text: "A+", customFont: "NunitoSans-Bold", customSize: 28, textColor: "#0E1012")
        return label
    }()
    
    private lazy var kgNumberLabel : UILabel = {
        let label = self.settinglabel(text: "80", customFont: "NunitoSans-Bold", customSize: 28, textColor: "#0E1012")
        return label
    }()
    
    private lazy var kgLabel : UILabel = {
        let label = self.settinglabel(text: "kg", customFont: "NunitoSans-Bold", customSize: 16, textColor: "#0E1012")
        return label
    }()
    
    private lazy var image1 : UIImageView = {
        let image = UIImageView(image: UIImage(named: "rate"))
        return image
    }()
    
    private lazy var image2 : UIImageView = {
        let image = UIImageView(image: UIImage(named: "blood"))
        return image
    }()
    
    private lazy var image3 : UIImageView = {
        let image = UIImageView(image: UIImage(named: "weight"))
        return image
    }()
    
    private lazy var dotsLabel1 : UILabel = {
        let label = UILabel()
        
        guard let customFont = UIFont(name: "NunitoSans-Regular", size: 27) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.text = "..."
        
        label.textColor = .black
        return label
    }()
    
    private lazy var dotsLabel2 : UILabel = {
        let label = UILabel()
        
        guard let customFont = UIFont(name: "NunitoSans-Regular", size: 27) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.text = "..."
        
        label.textColor = .black
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    private func setupUI () {
        self.backgroundColor = .white
        
        //MARK: Adding subviews
        self.addSubview(self.headerLabel)
        self.addSubview(self.view1)
        self.addSubview(self.view2)
        self.addSubview(self.view3)
        self.view1.addSubview(self.heartRateLabel)
        self.view1.addSubview(self.heartLabel)
        self.view1.addSubview(self.bpmLabel)
        self.view1.addSubview(self.image1)
        
        self.view2.addSubview(self.bloodGroupLabel)
        self.view2.addSubview(self.aLabel)
        self.view2.addSubview(self.image2)
        self.view2.addSubview(self.dotsLabel1)
        
        self.view3.addSubview(self.weightLabel)
        self.view3.addSubview(self.kgNumberLabel)
        self.view3.addSubview(self.kgLabel)
        self.view3.addSubview(self.image3)
        self.view3.addSubview(self.dotsLabel2)
        
        //MARK: Constraints
        self.headerLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(24)
        }
        
        self.view1.snp.makeConstraints { make in
            make.top.equalTo(self.headerLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(175)
        }
        
        self.view2.snp.makeConstraints { make in
            make.top.equalTo(self.view1.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(30)
            make.right.equalTo(self.view1.snp.centerX).offset(-6)
            make.height.equalTo(135)
        }
        
        self.view3.snp.makeConstraints { make in
            make.top.equalTo(self.view1.snp.bottom).offset(16)
            make.right.equalTo(self.view1.snp.right)
            make.left.equalTo(self.view1.snp.centerX).offset(6)
            make.height.equalTo(135)
        }
        
        self.heartRateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(33.5)
            make.left.equalToSuperview().offset(22)
        }
        
        self.heartLabel.snp.makeConstraints { make in
            make.top.equalTo(self.heartRateLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(22)
        }
        
        self.bpmLabel.snp.makeConstraints { make in
            make.left.equalTo(self.heartLabel.snp.right).offset(8)
            make.bottom.equalTo(self.heartLabel.snp.bottom).offset(-12)
        }
        
        self.image1.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(30)
            make.bottom.equalToSuperview().offset(-30)
            make.width.equalTo(147)
        }
        
        self.bloodGroupLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(55)
            make.left.equalToSuperview().offset(22)
        }
        
        self.aLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.view2.snp.bottom).offset(-16)
            make.left.equalToSuperview().offset(22)
        }
        
        self.image2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-90)
            make.width.equalTo(15)
        }
        
        self.dotsLabel1.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(7)
        }
        
        self.weightLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(55)
            make.left.equalToSuperview().offset(22)
        }
        
        self.kgNumberLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(22)
        }
        
        self.kgLabel.snp.makeConstraints { make in
            make.left.equalTo(self.kgNumberLabel.snp.right).offset(5)
            make.bottom.equalTo(self.kgNumberLabel.snp.bottom).offset(-4)
        }
        
        self.image3.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-90)
            make.width.equalTo(15)
        }
        
        self.dotsLabel2.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(7)
        }
    }
    
    //MARK: Functions
    private func settingView ( hexcode: String) -> UIView {
        let view = UIView()
        view.backgroundColor = hexStringToUIColor(hex: hexcode)
        view.layer.cornerRadius = 24
        view.clipsToBounds = true
        return view
    }
    
    private func settinglabel ( text: String, customFont: String, customSize: Int, textColor: String) -> UILabel {
        let label = UILabel()
        label.text = text
        
        guard let customFont = UIFont(name: customFont, size: CGFloat(customSize)) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: textColor)
        
        return label
        
    }
}



