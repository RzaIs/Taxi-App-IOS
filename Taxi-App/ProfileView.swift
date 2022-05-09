//
//  ProfileView.swift
//  Taxi-App
//
//  Created by Rza Ismayilov on 05.05.22.
//

import UIKit
import SnapKit

class ProfileView : UIView {
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()

        label.text = "Profile"
        label.textColor = UIColor(hexaRGB: "#19104E")
        label.font = UIFont.Bold(size: 20)
        
        self.addSubview(label)
        return label
    }()
    
    private lazy var avatarView : UIImageView = {
        let view = UIImageView(image: UIImage(named: "avatar"))

        self.addSubview(view)
        return view
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()

        label.text = "Amelia Barlow"
        label.textColor = UIColor(hexaRGB: "#19104E")
        label.font = UIFont.Bold(size: 20)
        
        self.addSubview(label)
        return label
    }()
    
    private lazy var bellView : UIView = {
        let view = UIView()
        let imageView = UIImageView(image: UIImage(named: "bell"))
        
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.layer.cornerRadius = 24
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
            make.height.width.equalTo(24)
        }
        
        self.addSubview(view)
        return view
    }()
    
    private lazy var cardView : CardView = {
        let view = CardView().setupView(parent: self)
                
        self.addSubview(view)
        return view
    }()
    
    private lazy var menuView : MenuView = {
        let view = MenuView().setupView()
        
        self.addSubview(view)
        self.sendSubviewToBack(view)
        return view
    }()
    
    public func setupView() -> ProfileView {
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(bellView.snp.centerY)
            make.centerX.equalToSuperview()
            make.right.lessThanOrEqualTo(bellView.snp.left).offset(8)
        }
        
        avatarView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(128)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        bellView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        cardView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
        
        menuView.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-32)
        }
        
        return self
    }
    
}
