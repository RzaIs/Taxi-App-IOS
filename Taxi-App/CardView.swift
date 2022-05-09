//
//  CardView.swift
//  Taxi-App
//
//  Created by Rza Ismayilov on 06.05.22.
//

import UIKit
import SnapKit

class CardView : UIView {
    
    private lazy var parent : UIView? = nil
    
    private lazy var currentScale : CGFloat = 1
    private lazy var currentRotation : CGFloat = 0;
    private lazy var currentTranslation : CGPoint = CGPoint(x: 0, y: 0)
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()

        label.text = "You won 300 points"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.Bold(size: 24)
        
        self.addSubview(label)
        return label
    }()
    
    private lazy var contentLabel : UILabel = {
        let label = UILabel()

        label.text = "Thanks for riding with us! you won 300 point from your last ride"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.Regular(size: 14)
        
        self.addSubview(label)
        return label
    }()
    
    private lazy var redeemBtn : UIButton = {
        let btn = UIButton()
        
        btn.layer.cornerRadius = 16
        btn.backgroundColor = .white
        btn.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        btn.setTitle("Redeem now 🔥", for: .normal)
        btn.titleLabel?.font = UIFont.Regular(size: 12)
        btn.setTitleColor(UIColor(hexaRGB: "#5256E8"), for: .normal)
        btn.titleLabel?.textAlignment = .center
        
        self.addSubview(btn)
        return btn
    }()
    
    public func setupView(parent : UIView) -> CardView {
        
        self.parent = parent
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(onPinch(_:)))
        self.addGestureRecognizer(pinch)
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(onRotate(_:)))
        self.addGestureRecognizer(rotate)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        self.addGestureRecognizer(pan)
        
        self.backgroundColor = UIColor(hexaRGB: "#5256E8")
        self.layer.cornerRadius = 24
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        redeemBtn.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
                
        return self
    }
    
    @objc func onPinch(_ sender: UIPinchGestureRecognizer) {
        if (sender.state == .changed) {
            let transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
                .rotated(by: currentRotation).translatedBy(x: currentTranslation.x, y: currentTranslation.y)
            self.transform = transform
        } else if (sender.state == .ended) {
            currentScale = sender.scale
        }
    }
    
    @objc func onRotate(_ sender: UIRotationGestureRecognizer) {
        if (sender.state == .changed) {
            let transform = CGAffineTransform(rotationAngle: sender.rotation)
                .scaledBy(x: currentScale, y: currentScale).translatedBy(x: currentTranslation.x, y: currentTranslation.y)
            self.transform = transform
        } else if (sender.state == .ended) {
            currentRotation = sender.rotation
        }
    }
    
    @objc func onPan(_ sender: UIPanGestureRecognizer) {
        if (sender.state == .changed) {
            let translation = sender.translation(in: self.parent)
            let transform = CGAffineTransform(translationX: translation.x, y: translation.y)
                .rotated(by: currentRotation).scaledBy(x: currentScale, y: currentScale)
            self.transform = transform
        } else if (sender.state == .ended) {
            currentTranslation = sender.translation(in: self.parent)
        }
    }
}
