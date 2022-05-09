//
//  LocationItem.swift
//  Taxi-App
//
//  Created by Rza Ismayilov on 06.05.22.
//

import UIKit

class LocationItem: UIView {

    private lazy var iconImg : UIImageView = {
        let img = UIImageView(image: UIImage(named: "locIcon"))
        self.addSubview(img)
        return img
    }()
    
    private lazy var locNameLabel : UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor(hexaRGB: "#19104E")
        label.font = UIFont.Regular(size: 16)
        
        self.addSubview(label)
        return label
    }()
    
    private lazy var locAdrsLabel : UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor(hexaRGB: "#A9A9AA")
        label.font = UIFont.Regular(size: 14)

        self.addSubview(label)
        return label
    }()
    
    public func setupView(locName : String, locAdrs : String) -> LocationItem {
        
        locNameLabel.text = locName
        locAdrsLabel.text = locAdrs

        iconImg.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.height.equalTo(42)
        }
        
        locNameLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImg.snp.top)
            make.left.equalTo(iconImg.snp.right).offset(8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalTo(iconImg.snp.centerY)
        }
        
        locAdrsLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImg.snp.centerY)
            make.left.equalTo(iconImg.snp.right).offset(8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalTo(iconImg.snp.bottom)
        }
        
        return self
    }

}
