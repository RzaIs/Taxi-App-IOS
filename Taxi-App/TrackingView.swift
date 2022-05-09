//
//  TrackingView.swift
//  Taxi-App
//
//  Created by Rza Ismayilov on 07.05.22.
//

import UIKit
import SnapKit

class TrackingView: UIView {

    private lazy var line : UIView = {
        let view = UIView()

        view.backgroundColor = UIColor(hexaRGB: "#E5E5EB")
        
        self.addSubview(view)
        return view
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        
        label.text = "Driver is on the way"
        label.textColor = .black
        label.font = UIFont.Bold(size: 22)

        self.addSubview(label)
        return label
    }()
    
    private lazy var driverView : UIView = {
        let view = UIView()

        let img : UIImageView = {
            let img = UIImageView()
            img.image = UIImage(named: "driverAvatar")
            
            view.addSubview(img)
            return img
        }()
        
        let headingView : UIView = {
            let tv = UIView()

            let img = UIImageView(image: UIImage(named: "captain"))
            tv.addSubview(img)
            
            let label = UILabel()
            label.textColor = UIColor(hexaRGB: "#A9A9AA")
            label.font = UIFont.Regular(size: 14)
            label.text = "Your captain"
            tv.addSubview(label)
            
            img.snp.makeConstraints { make in
                make.left.equalToSuperview()
                make.centerY.equalToSuperview()
                make.width.height.equalTo(16)
            }
            
            label.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.left.equalTo(img.snp.right).offset(8)
                make.right.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
            view.addSubview(tv)
            return tv
        }()
        
        let nameLabel : UILabel = {
            let label = UILabel()

            label.text = "Melik Qasimov"
            label.textColor = UIColor(hexaRGB: "#19104E")
            label.font = UIFont.Regular(size: 16)
            
            view.addSubview(label)
            return label
        }()
        
        let phoneImg : UIImageView = {
            let img = UIImageView(image: UIImage(named: "phoneIcon"))
            
            view.addSubview(img)
            return img
        }()
        
        let mailImg : UIImageView = {
            let img = UIImageView(image: UIImage(named: "mailIcon"))
            
            view.addSubview(img)
            return img
        }()
        
        img.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        headingView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(img.snp.right).offset(16)
            make.right.equalTo(phoneImg.snp.left).offset(16)
            make.height.greaterThanOrEqualTo(16)
            make.bottom.equalTo(img.snp.centerY)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(img.snp.centerY)
            make.left.equalTo(img.snp.right).offset(16)
            make.right.equalTo(phoneImg.snp.left).offset(16)
            make.bottom.equalToSuperview()
        }
        
        phoneImg.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalTo(mailImg.snp.left).offset(-16)
            make.bottom.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        mailImg.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        self.addSubview(view)
        return view
    }()
    
    private lazy var pickupView : UIView = {
        let view = UIView()
        
        let imgView : UIImageView = {
            let img = UIImageView()
            img.image = UIImage(systemName: "circle")?.withTintColor(UIColor(hexaRGB: "#F26060")!, renderingMode: .alwaysOriginal)
            
            view.addSubview(img)
            return img
        }()

        let titleLabel : UILabel = {
            let label = UILabel()
            
            label.text = "Pickup location"
            label.textColor = UIColor(hexaRGB: "#A9A9AA")
            label.font = UIFont.Regular(size: 14)
            
            view.addSubview(label)
            return label
        }()
        
        let locName : UILabel = {
            let label = UILabel()
            
            label.text = "26 Shirin Mirzayev St, Baku, Azerbaijan"
            label.textColor = UIColor(hexaRGB: "#19104E")
            label.font = UIFont.Regular(size: 16)
            
            view.addSubview(label)
            return label
        }()
        
        imgView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(imgView.snp.right).offset(16)
            make.right.equalToSuperview()
            make.bottom.equalTo(imgView.snp.centerY)
        }
        
        locName.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.centerY)
            make.left.equalTo(imgView.snp.right).offset(16)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.addSubview(view)
        return view
    }()
    
    private lazy var dropLocNameLabel : UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor(hexaRGB: "#19104E")
        label.font = UIFont.Regular(size: 16)
        
        return label
    }()
    
    private lazy var dropoffView : UIView = {
        let view = UIView()
        
        let imgView : UIImageView = {
            let img = UIImageView(image: UIImage(named: "locationIcon"))

            view.addSubview(img)
            return img
        }()
        
        let titleLbl : UILabel = {
            let label = UILabel()
            
            label.text = "Drop off"
            label.textColor = UIColor(hexaRGB: "#A9A9AA")
            label.font = UIFont.Regular(size: 14)
            
            view.addSubview(label)
            return label
        }()
        
        view.addSubview(dropLocNameLabel)
        
        imgView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(23)
        }
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(imgView.snp.right).offset(16)
            make.right.equalToSuperview()
            make.bottom.equalTo(imgView.snp.centerY)
        }
        
        dropLocNameLabel.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.centerY)
            make.left.equalTo(imgView.snp.right).offset(16)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.addSubview(view)
        return view
    }()
    
    private lazy var paymentView : UIView = {
        let view = UIView()
        
        let titleLbl : UILabel = {
            let label = UILabel()
            
            label.text = "Payment"
            label.textColor = UIColor(hexaRGB: "#A9A9AA")
            label.font = UIFont.Regular(size: 14)
            
            view.addSubview(label)
            return label
        }()
        
        let cardInfoLabel : UILabel = {
            let label = UILabel()
            
            label.text = "Card : •••• •••• 7846"
            label.textColor = UIColor(hexaRGB: "#19104E")
            label.font = UIFont.Regular(size: 16)
            
            view.addSubview(label)
            return label
        }()
        
        let priceLabel : UILabel = {
            let label = UILabel()
            
            label.text = "$24"
            label.textColor = UIColor(hexaRGB: "#F26060")
            label.font = UIFont.Bold(size: 24)
            
            view.addSubview(label)
            return label
        }()
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        cardInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(8)
            make.left.equalToSuperview()
            make.right.lessThanOrEqualTo(priceLabel.snp.left).offset(8)
            make.bottom.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(8)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        self.addSubview(view)
        return view
    }()
    
    private lazy var taxiIconView : UIView = {
        let view = UIView()
        
        view.layer.borderWidth = 1
        view.layer.borderColor  = UIColor(hexaRGB: "#DEDEE8")?.cgColor
        view.layer.cornerRadius = 18
        
        let icon : UILabel = {
            let label =  UILabel()
            
            label.text = "🚕"
            label.font = UIFont.systemFont(ofSize: 18)
            
            view.addSubview(label)
            return label
        }()
        
        icon.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.addSubview(view)
        return view
    }()
    
    public func setupView(dropLocName : String) -> TrackingView {
        
        self.layer.cornerRadius = 32
        self.backgroundColor = .white
        
        dropLocNameLabel.text = dropLocName

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
        
        driverView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.height.greaterThanOrEqualTo(40)
        }
        
        let lineBreak1 = getLine()
        lineBreak1.snp.makeConstraints { make in
            make.top.equalTo(driverView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.height.equalTo(1)
        }
        
        pickupView.snp.makeConstraints { make in
            make.top.equalTo(lineBreak1.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
//            make.bottom.equalToSuperview().offset(-32)
            make.height.greaterThanOrEqualTo(20)
        }
        
        let lineBreak2 = getLine()
        lineBreak2.snp.makeConstraints { make in
            make.top.equalTo(pickupView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalTo(taxiIconView.snp.left).offset(-8)
            make.height.equalTo(1)
        }
        
        taxiIconView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-32)
            make.centerY.equalTo(lineBreak2.snp.centerY)
            make.width.height.equalTo(36)
        }
        
        dropoffView.snp.makeConstraints { make in
            make.top.equalTo(lineBreak2.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.height.greaterThanOrEqualTo(23)
        }
        
        let lineBreak3 = getLine()
        lineBreak3.snp.makeConstraints { make in
            make.top.equalTo(dropoffView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.height.equalTo(1)
        }
        
        paymentView.snp.makeConstraints { make in
            make.top.equalTo(lineBreak3.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.height.greaterThanOrEqualTo(23)
            make.bottom.equalToSuperview().offset(-48)

        }



        
        
        return self
    }
    
    private func getLine() -> UIView {
        let view = UIView()
        
        view.backgroundColor = UIColor(hexaRGB: "#DEDEE8")
        
        self.addSubview(view)
        return view
    }

}
