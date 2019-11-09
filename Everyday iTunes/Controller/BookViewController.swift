//
//  BookViewController.swift
//  Everyday iTunes
//
//  Created by 白鳃 Cc on 11/7/19.
//  Copyright © 2019 白鳃 Cc. All rights reserved.
//

import Foundation
import UIKit

class BookViewController: UIViewController {
    let topLabel : UILabel = {
        let label = UILabel()
        label.text = "Top 50 Paid Books"
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
        let urlString = "https://rss.itunes.apple.com/api/v1/us/audiobooks/top-audiobooks/all/50/explicit.json"
        let bookList = TopListTableViewController(urlString: urlString)

        // Set child VC
        self.addChild(bookList)

        //Add child's view to parent
        self.view.addSubview(bookList.view)

        //Register child VC
        bookList.didMove(toParent: self)

        bookList.view.translatesAutoresizingMaskIntoConstraints = false
        bookList.view.topAnchor.constraint(equalTo: self.topLabel.bottomAnchor, constant: 60).isActive = true
        bookList.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        bookList.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        bookList.view.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        bookList.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}
