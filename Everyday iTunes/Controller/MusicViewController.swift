//
//  MusicViewController.swift
//  Everyday iTunes
//
//  Created by 白鳃 Cc on 11/7/19.
//  Copyright © 2019 白鳃 Cc. All rights reserved.
//

import Foundation
import UIKit

class MusicViewController: UIViewController {

    let topLabel : UILabel = {
        let label = UILabel()
        label.text = "Top 50 Songs in Apple Music"
        label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 30.0)
        label.textAlignment = NSTextAlignment.left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        self.view.addSubview(topLabel)

        topLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80).isActive = true
        topLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 25).isActive = true

        // Create child VC
        let musicList = MusicListTableViewController()

        // Set child VC
        self.addChild(musicList)

        //Add child's view to parent
        self.view.addSubview(musicList.view)

        //Register child VC
        musicList.didMove(toParent: self)

        musicList.view.translatesAutoresizingMaskIntoConstraints = false
        musicList.view.topAnchor.constraint(equalTo: self.topLabel.bottomAnchor, constant: 60).isActive = true
        musicList.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        musicList.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        musicList.view.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        musicList.view.heightAnchor.constraint(equalToConstant: 800).isActive = true
    }

    
}
