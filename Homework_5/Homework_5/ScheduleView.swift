//
//  ReportView.swift
//  Homework_5
//
//  Created by Ismayil Ismayilov on 28.04.22.
//

import UIKit
import SnapKit

class ScheduleView : UIView {
    
    //MARK: Variables
    private var selectedDate : Date? = nil {
        didSet {
            self.updateDateText()
        }
    }
    
    //MARK: UI Components
    private lazy var headerLabel : UILabel = {
       let label = UILabel()
        label.text = "Schedule"
        
        guard let customFont = UIFont(name: "NunitoSans-Bold", size: 27) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var dateLabel : UILabel = {
       let label = UILabel()
        
        guard let customFont = UIFont(name: "NunitoSans-SemiBold", size: 20) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#888888")
        
        return label
    }()
    
    private lazy var datePicker : UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(self.onDatePickertap(_:)), for: .valueChanged)
        return datePicker
    }()
    
//    private lazy var calendarIcon : UIImageView = {
//       let icon = UIImageView(image: UIImage(named: "calendar"))
//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onCalendarTap))
//        icon.addGestureRecognizer(gestureRecognizer)
//        return icon
//    }()
    
    private lazy var dateSelectButton : UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "calendar"), for: .normal)
        button.addTarget(self, action: #selector(self.onClick), for: .touchUpInside)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 24, left: 22, bottom: 24, right: 22)
        return button
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
        self.addSubview(self.dateLabel)
        self.addSubview(self.dateSelectButton)
        
        
        //MARK: Constraints
        self.headerLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(24)
        }
        
        self.dateLabel.snp.makeConstraints { make in
            make.top.equalTo(self.headerLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(30)
        }
        
        self.dateSelectButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-30)
            make.centerY.equalTo(self.headerLabel.snp.centerY)
            make.width.equalTo(21.6)
            make.height.equalTo(24)
            
        }
    }
    
    //MARK: Functions
    @objc func onClick () {
        self.showDatePicker()
    }
    
    private func showDatePicker () {
        self.addSubview(self.datePicker)
        
        self.datePicker.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.safeAreaLayoutGuide.snp.right)
        }
    }
    
    @objc func onDatePickertap (_ sender: UIDatePicker ) {
        self.selectedDate = sender.date
    }
    
    private func updateDateText () {
        guard let date = self.selectedDate else {
            self.dateLabel.text = "Not selected"
            return
        }
         let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        
        self.dateLabel.text = dateFormatter.string(from: date)
    }
}
