//
//  MenuView.swift
//  Taxi-App
//
//  Created by Rza Ismayilov on 06.05.22.
//

import UIKit
import SnapKit

class MenuView: UIScrollView {
    
    private lazy var items : [UIView] = [
        getItem(title: "Profile Info", imageName: "profileInfo"),
        getLine(),
        getItem(title: "Cards", imageName: "cards"),
        getLine(),
        getItem(title: "Settings", imageName: "settings"),
        getLine(),
        getItem(title: "Activities", imageName: "activities"),
        getLine(),
        getItem(title: "My wallet", imageName: "myWallet"),
    ]
    
    private lazy var stackView : UIStackView = {
        let view = UIStackView()

        view.distribution = .equalCentering
        view.axis = .vertical
        
        self.addSubview(view)
        return view
    }()
    
    public func setupView() -> MenuView {
        
        items.forEach { view in
            stackView.addArrangedSubview(view)
        }
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 24
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.contentLayoutGuide.snp.top)
            make.left.equalTo(self.contentLayoutGuide.snp.left)
            make.right.equalTo(self.contentLayoutGuide.snp.right)
            make.bottom.equalTo(self.contentLayoutGuide.snp.bottom)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        return self
    }
    
    private func getItem(title : String, imageName : String) -> UIView {
        let view = UIView()
        
        let iconView = UIImageView(image: UIImage(named: imageName))
        view.addSubview(iconView)
        
        let arrowView = UIImageView(image: UIImage(named: "arrow"))
        view.addSubview(arrowView)
        
        let titleLabel : UILabel  = {
            let label = UILabel()
            
            label.text = title
            label.font = UIFont.Regular(size: 16)
            label.textColor = UIColor(hexaRGB: "#19104E")
            
            view.addSubview(label)
            return label
        }()
        
        iconView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.height.equalTo(36)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconView.snp.right).offset(16)
            make.centerY.equalToSuperview()
            make.right.lessThanOrEqualTo(arrowView.snp.left).offset(-16)
        }
        
        arrowView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.height.equalTo(16)
            make.width.equalTo(8)
        }
        

        return view
    }

    private func getLine() -> UIView {
        let view = UIView()
        
        view.backgroundColor = UIColor(hexaRGB: "#F5F5FF")
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        return view
    }

}
