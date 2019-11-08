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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Create child VC
        let musicList = ListTableViewController()

        // Set child VC
        self.addChild(musicList)

        //Add child's view to parent
        self.view.addSubview(musicList.view)

        //Register child VC
        musicList.didMove(toParent: self)

        musicList.view.translatesAutoresizingMaskIntoConstraints = false
        musicList.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        musicList.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        musicList.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        musicList.view.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        musicList.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
