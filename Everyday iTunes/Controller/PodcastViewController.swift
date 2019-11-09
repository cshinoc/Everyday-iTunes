//
//  MovieViewController.swift
//  Everyday iTunes
//
//  Created by 白鳃 Cc on 11/7/19.
//  Copyright © 2019 白鳃 Cc. All rights reserved.
//

import Foundation
import UIKit

class PodcastViewController: UIViewController {

    let topLabel : UILabel = {
        let label = UILabel()
        label.text = "Top 50 Podcasts"
        label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 40.0)
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
        let urlString = "https://rss.itunes.apple.com/api/v1/us/podcasts/top-podcasts/all/50/explicit.json"
        let podcastList = TopListTableViewController(urlString: urlString)

        // Set child VC
        self.addChild(podcastList)

        //Add child's view to parent
        self.view.addSubview(podcastList.view)

        //Register child VC
        podcastList.didMove(toParent: self)

        podcastList.view.translatesAutoresizingMaskIntoConstraints = false
        podcastList.view.topAnchor.constraint(equalTo: self.topLabel.bottomAnchor, constant: 60).isActive = true
        podcastList.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        podcastList.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        podcastList.view.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        podcastList.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}
