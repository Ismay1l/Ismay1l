//
//  ReportView.swift
//  Homework_5
//
//  Created by Ismayil Ismayilov on 28.04.22.
//

import UIKit
import SnapKit

class AppoinmentsView : UIView, UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.frame.width
        self.pageControl.currentPage = Int(index)
    }
    
    //MARK: UI Components
    private lazy var headerLabel : UILabel = {
       let label = UILabel()
        label.text = "Appointments"
        
        guard let customFont = UIFont(name: "NunitoSans-Bold", size: 27) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var upcomingLabel : UILabel = {
       let label = UILabel()
        label.text = "Upcoming Appointments"
        
        guard let customFont = UIFont(name: "NunitoSans-Bold", size: 17) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.delegate = self
        return view
    }()
    
    private lazy var stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 60
        return view
    }()
    
    private lazy var view1 : UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var view2 : UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var view3 : UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var pageControl : UIPageControl = {
       let control = UIPageControl()
        control.addTarget(self, action: #selector(onPageControlChange(_:)), for: .valueChanged)
        control.currentPageIndicatorTintColor = .systemBlue
        control.pageIndicatorTintColor = .systemGray
        control.numberOfPages = 3
        control.currentPage = 0
        return control
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
        self.addSubview(self.upcomingLabel)
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stackView)
        self.addSubview(self.pageControl)
        
        //MARK: Constraints
        self.headerLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(24)
        }
        
        self.upcomingLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(self.headerLabel.snp.bottom).offset(24)
        }
        
        self.scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.upcomingLabel.snp.bottom).offset(14)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(150)
        }
        
        self.stackView.snp.makeConstraints { make in
            make.top.equalTo(self.scrollView.contentLayoutGuide.snp.top)
            make.left.equalTo(self.scrollView.contentLayoutGuide.snp.left).offset(30)
            make.bottom.equalTo(self.scrollView.contentLayoutGuide.snp.bottom)
            make.right.equalTo(self.scrollView.contentLayoutGuide.snp.right).offset(-30)
        }
        
        self.view1.addSubview(self.settingView(clockText: "09:30 AM", dateText: "12", dayText: "Tue", name: "Dr. Mim Akhter", problem: "Depression", mainColor: "#1C6BA4", color: "#7CA9F4"))

        self.view2.addSubview(self.settingView(clockText: "11:50 AM", dateText: "26", dayText: "Wed", name: "Dr. James Harley", problem: "Headache", mainColor: "#E09F1F", color: "#FBB291"))

        self.view3.addSubview(self.settingView(clockText: "05:00 PM", dateText: "07", dayText: "Sat", name: "Dr. Taylor Anne", problem: "Cold", mainColor: "#A523BB", color: "#AC50E1"))
        
        self.stackView.addArrangedSubview(self.view1)
        self.stackView.addArrangedSubview(self.view2)
        self.stackView.addArrangedSubview(self.view3)
        
        self.view1.snp.makeConstraints { make in
            make.height.equalTo(125)
            make.width.equalTo(354)
        }
       
        self.view2.snp.makeConstraints { make in
            make.height.equalTo(125)
            make.width.equalTo(354)
        }
        
        self.view3.snp.makeConstraints { make in
            make.height.equalTo(125)
            make.width.equalTo(354)
        }
        
        self.pageControl.snp.makeConstraints { make in
            make.top.equalTo(self.scrollView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: Functions
    private func settingView (clockText: String, dateText: String, dayText: String, name: String, problem: String, mainColor: String, color: String) -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 28
        view.clipsToBounds = true
        view.backgroundColor = hexStringToUIColor(hex: mainColor)
        
        let view2 = UIView()
        view2.backgroundColor = hexStringToUIColor(hex: color)
        view2.clipsToBounds = true
        view2.layer.cornerRadius = 26
        
        let dateLabel = UILabel()
        dateLabel.text = dateText
        
        guard let customFont1 = UIFont(name: "NunitoSans-ExtraBold", size: 22) else {
            fatalError()
        }
        
        dateLabel.font = UIFontMetrics.default.scaledFont(for: customFont1)
        dateLabel.adjustsFontForContentSizeCategory = true
        
        dateLabel.textColor = .white
        
        let dayLabel = UILabel()
        dayLabel.text = dayText
        
        guard let customFont2 = UIFont(name: "NunitoSans-SemiBold", size: 16) else {
            fatalError()
        }
        
        dayLabel.font = UIFontMetrics.default.scaledFont(for: customFont2)
        dayLabel.adjustsFontForContentSizeCategory = true
        
        dayLabel.textColor = .white
        
        let clockLabel = UILabel()
        clockLabel.text = clockText
        
        guard let customFont3 = UIFont(name: "NunitoSans-Regular", size: 14) else {
            fatalError()
        }
        
        clockLabel.font = UIFontMetrics.default.scaledFont(for: customFont3)
        clockLabel.adjustsFontForContentSizeCategory = true
        
        clockLabel.textColor = .white
        
        let namelabel = UILabel()
        namelabel.text = name
        
        guard let customFont4 = UIFont(name: "NunitoSans-Bold", size: 19) else {
            fatalError()
        }
        
        namelabel.font = UIFontMetrics.default.scaledFont(for: customFont4)
        namelabel.adjustsFontForContentSizeCategory = true
        
        namelabel.textColor = .white
        
        let problemLabel = UILabel()
        problemLabel.text = problem
        
        guard let customFont5 = UIFont(name: "NunitoSans-Regular", size: 15) else {
            fatalError()
        }
        
        problemLabel.font = UIFontMetrics.default.scaledFont(for: customFont5)
        problemLabel.adjustsFontForContentSizeCategory = true
        
        problemLabel.textColor = .systemGray6
        
        let dotsLabel = UILabel()
        
        guard let customFont = UIFont(name: "NunitoSans-Regular", size: 27) else {
            fatalError()
        }
        
        dotsLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        dotsLabel.adjustsFontForContentSizeCategory = true
        
        dotsLabel.text = "..."
        
        dotsLabel.textColor = .black
        
        view.addSubview(view2)
        view2.addSubview(dateLabel)
        view2.addSubview(dayLabel)
        view.addSubview(clockLabel)
        view.addSubview(namelabel)
        view.addSubview(problemLabel)
        view.addSubview(dotsLabel)
        
        view.snp.makeConstraints { make in
            make.height.equalTo(125)
            make.width.equalTo(354)
        }
        
        view2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(14)
            make.width.equalTo(72)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(21.51)
            make.centerX.equalToSuperview()
        }
        
        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(4)
            make.centerX.equalTo(dateLabel.snp.centerX)
        }
        
        clockLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.left.equalTo(view2.snp.right).offset(16.85)
        }
        
        namelabel.snp.makeConstraints { make in
            make.top.equalTo(clockLabel.snp.bottom).offset(2)
            make.left.equalTo(view2.snp.right).offset(16.85)
        }
        
        problemLabel.snp.makeConstraints { make in
            make.top.equalTo(namelabel.snp.bottom).offset(3)
            make.left.equalTo(view2.snp.right).offset(16.85)
        }
        
        dotsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20.23)
            make.right.equalToSuperview().offset(23.17)
        }
        
        return view
    }
    
    @objc func onPageControlChange (_ sender: UIPageControl ) {
        self.scrollView.setContentOffset(CGPoint(x: (sender.currentPage) * Int(self.scrollView.frame.width), y: 0), animated: true)
    }
    

}


