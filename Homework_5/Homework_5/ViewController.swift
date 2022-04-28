//
//  ViewController.swift
//  Homework_5
//
//  Created by Ismayil Ismayilov on 28.04.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: Variables
    private let segments = ["Report", "Appointments", "Schedule"]
    
    let customFont =  UIFont(name: "NunitoSans-Regular", size: 16)
    
    
    //MARK: UI Components
    private lazy var segmentView : UIView = {
        let view = UIView()
        view.backgroundColor = hexStringToUIColor(hex: "#F9F9F9")
        return view
    }()
    
    private lazy var segmentControl : UISegmentedControl = {
        let control = UISegmentedControl(items: self.segments)
        control.setTitleTextAttributes([NSAttributedString.Key.font : self.customFont!], for: .normal)
        control.addTarget(self, action: #selector(self.onSegmentChanged(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0
        
        return control
    }()
    
    private lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var reportView : ReportView = {
        let view = ReportView()
        return view
    }()
    
    private lazy var appointmentsView : AppoinmentsView = {
        let view = AppoinmentsView()
        return view
    }()
    
    private lazy var scheduleView : ScheduleView = {
        let view = ScheduleView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        //MARK: Adding subviews
        self.view.addSubview(self.segmentView)
        self.view.addSubview(self.segmentControl)
        self.view.addSubview(self.containerView)
        
        //MARK: Constraints
        self.segmentView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(13.67)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
        }
        
        self.segmentControl.snp.makeConstraints { make in
            make.top.equalTo(self.segmentView.snp.top).offset(6)
            make.left.equalTo(self.segmentView.snp.left).offset(16)
            make.right.equalTo(self.segmentView.snp.right).offset(-16)
            make.bottom.equalTo(self.segmentView.snp.bottom).offset(-6)
        }
        
        self.containerView.snp.makeConstraints { make in
            make.top.equalTo(self.segmentView.snp.bottom)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    //MARK: Functions
    @objc func onSegmentChanged (_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.fillContainer(segmentView: self.reportView)
            break
        case 1:
            self.fillContainer(segmentView: self.appointmentsView)
            break
        case 2:
            self.fillContainer(segmentView: self.scheduleView)
            break
        default:
            break
        }
    }
    
    private func fillContainer ( segmentView: UIView) {
        self.containerView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
        self.containerView.addSubview(segmentView)
        
        segmentView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}


