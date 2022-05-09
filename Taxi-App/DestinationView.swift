//
//  DestinationView.swift
//  Taxi-App
//
//  Created by Rza Ismayilov on 06.05.22.
//

import UIKit
import SnapKit

class DestinationView: UIView {
    
    private var parent : LocationView?
    
    private lazy var line : UIView = {
        let view = UIView()

        view.backgroundColor = UIColor(hexaRGB: "#E5E5EB")
        
        self.addSubview(view)
        return view
    }()

    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        
        label.text = "Where you want to go?"
        label.textColor = .black
        label.font = UIFont.Bold(size: 22)
        
        self.addSubview(label)
        return label
    }()
    
    public lazy var searchView : UIView = {
       let view = UIView()
        
        let glassImage : UIImageView = {
            let img = UIImageView()
            
            img.image = UIImage(systemName: "magnifyingglass")?.withTintColor(UIColor(hexaRGB: "#4E4E58")!, renderingMode: .alwaysOriginal)
            
            view.addSubview(img)
            return img
        }()
        
        let searchField : UITextField = {
            let field = UITextField()
            
            field.placeholder = "Enter destination"
            
            view.addSubview(field)
            return field
        }()
        
        glassImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
            make.height.width.equalTo(24)
        }
        
        searchField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(glassImage.snp.right).offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        
        view.backgroundColor = UIColor(hexaRGB: "#F1F1F5")
        view.layer.cornerRadius = 24
        
        self.addSubview(view)
        return view
    }()
    
    private lazy var historyLabel : UILabel = {
        let label = UILabel()

        label.text = "History"
        label.textColor = UIColor(hexaRGB: "#19104E")
        label.font = UIFont.Bold(size: 22)

        self.addSubview(label)
        return label
    }()
    
    private lazy var location1 : LocationItem = {
        let view = LocationItem().setupView(locName: "28 Mall", locAdrs: "1014, Azadlig avenu 15a/4 Baku AZ, Bakı")
        
        let gesture = CustomTapGestureRecognizer(target: self, action: #selector(chooseDest(_:)))
        gesture.newView = ConfirmationView().setupView(locName: "28 Mall", locAdrs: "1014, Azadlig avenu 15a/4 Baku AZ, Bakı", parent: self.parent!)
        view.addGestureRecognizer(gesture)

        self.addSubview(view)
        return view
    }()

    private lazy var location2 : LocationItem = {
        let view = LocationItem().setupView(locName: "Akhundov National Library", locAdrs: "29 Khagani Street, Baku 1000")
        
        let gesture = CustomTapGestureRecognizer(target: self, action: #selector(chooseDest(_:)))
        gesture.newView = ConfirmationView().setupView(locName: "Akhundov National Library", locAdrs: "29 Khagani Street, Baku 1000", parent: self.parent!)
        view.addGestureRecognizer(gesture)
        
        self.addSubview(view)
        return view
    }()
    

    public func setupView(parent: LocationView) -> DestinationView {
        
        self.parent = parent
        self.layer.cornerRadius = 32
        self.backgroundColor = .white
        
        
        
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
        
        searchView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
        
        historyLabel.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
        
        location1.snp.makeConstraints { make in
            make.top.equalTo(historyLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }

        location2.snp.makeConstraints { make in
            make.top.equalTo(location1.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-48)
        }
        
        return self
    }
    
    @objc func chooseDest(_ sender : CustomTapGestureRecognizer) {
        if (sender.state == .recognized) {
            parent?.loadBottomView(newView: sender.newView!)
        }
    }
}

class CustomTapGestureRecognizer : UITapGestureRecognizer {
    public var newView : UIView?
}
