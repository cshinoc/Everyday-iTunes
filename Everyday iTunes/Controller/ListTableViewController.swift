//
//  CellData.swift
//  Everyday iTunes
//
//  Created by 白鳃 Cc on 11/7/19.
//  Copyright © 2019 白鳃 Cc. All rights reserved.
//

import UIKit

struct CellData {
    let image: UIImage?
    let infomation: String?
}

class ListTableViewController: UITableViewController, MusicManagerDelegate {

    var data = [CellData]()

    var images = [UIImage]()

    var songNames = [String]()

    var artists = [String]()

    var musicManager = MusicManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        musicManager.performRequest()
        musicManager.delegate = self
        
        data = [CellData.init(image: UIImage(named: "cat.png"), infomation: "blahblah")]

        print("blah")

        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")

        self.tableView.rowHeight = UITableView.automaticDimension

//        self.tableView.estimatedRowHeight = 200
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        cell.cellImag = data[indexPath.row].image
        cell.cellInfo = data[indexPath.row].infomation
        cell.layoutSubviews()

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func didUpdateMusicData(top50: [Result]) {
        for res in top50 {
            let imageURL = URL(string: res.artworkUrl100)!
            let imageData = try! Data(contentsOf: imageURL)
            images.append(UIImage(data: imageData)!)

            songNames.append(res.name)

            artists.append(res.artistName)
        }
//        data = [CellData.init(image: images[0], infomation: songNames[0])]

    }
}
