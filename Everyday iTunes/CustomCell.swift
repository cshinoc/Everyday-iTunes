//
//  CustomCell.swift
//  Everyday iTunes
//
//  Created by 白鳃 Cc on 11/7/19.
//  Copyright © 2019 白鳃 Cc. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    var cellInfo : String?
    var cellImag : UIImage?

    var InfoView : UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()

    var cellImagView : UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(cellImagView)
        self.addSubview(InfoView)

        cellImagView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        cellImagView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellImagView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cellImagView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        cellImagView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        InfoView.leftAnchor.constraint(equalTo: self.cellImagView.rightAnchor).isActive = true
        InfoView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        InfoView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        InfoView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if let infomation = cellInfo {
            InfoView.text = infomation
        }

        if let image = cellImag {
            cellImagView.image = image
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
