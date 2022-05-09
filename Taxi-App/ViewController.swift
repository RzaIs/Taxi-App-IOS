//
//  ViewController.swift
//  Taxi-App
//
//  Created by Rza Ismayilov on 05.05.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
//    private lazy var profileView : ProfileView = {
//        let view = ProfileView().setupView()
//
//        self.view.addSubview(view)
//        return view
//    }()
    
    private lazy var locationView : LocationView = {
        let view = LocationView().setupView()

        self.view.addSubview(view)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = UIColor(hexaRGB: "#F5F8FF")
        
//        profileView.snp.makeConstraints { make in
//            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
//            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
//            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
//            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
//        }
        
        locationView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }


}

