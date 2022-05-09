//
//  ConfirmationView.swift
//  Taxi-App
//
//  Created by Rza Ismayilov on 06.05.22.
//

import UIKit
import SnapKit

class ConfirmationView: UIView {
    
    private var parent : LocationView?
    private var locationName : String = "Error"

    private lazy var line : UIView = {
        let view = UIView()

        view.backgroundColor = UIColor(hexaRGB: "#E5E5EB")
        
        self.addSubview(view)
        return view
    }()

    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        
        label.text = "Confirm pickup"
        label.textColor = .black
        label.font = UIFont.Bold(size: 22)

        self.addSubview(label)
        return label
    }()
    
    private lazy var locationItem : LocationItem = {
        let view = LocationItem()
        
        self.addSubview(view)
        return view
    }()
    
    private lazy var confirmBtn : UIView = {
        let btn = UIView()
        btn.backgroundColor = UIColor(hexaRGB: "#5256E8")
        btn.layer.cornerRadius = 32

        let btnLabel : UILabel = {
            let label = UILabel()

            label.textAlignment = .center
            label.text = "Confirm ride"
            label.textColor = .white
            label.font = UIFont.Bold(size: 18)

            btn.addSubview(label)
            return label
        }()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(confirmRide(_:)))
        btn.addGestureRecognizer(gesture)
        
        btnLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        self.addSubview(btn)
        return btn
    }()
    
    public func setupView(locName : String, locAdrs : String, parent: LocationView) -> ConfirmationView {
        
        
        self.parent = parent
        self.locationName = locName
        self.layer.cornerRadius = 32
        self.backgroundColor = .white
        
        locationItem = locationItem.setupView(locName: locName, locAdrs: locAdrs)
        
        line.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(4)
            make.width.equalTo(64)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
        
        locationItem.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
        
        confirmBtn.snp.makeConstraints { make in
            make.top.equalTo(locationItem.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-48)
            make.height.equalTo(64)
        }
        
        return self
    }
    
    @objc func confirmRide(_ sender : UITapGestureRecognizer) {
        if (sender.state == .recognized) {
            parent?.loadBottomView(newView: TrackingView().setupView(dropLocName: locationName))
        }
    }

}
