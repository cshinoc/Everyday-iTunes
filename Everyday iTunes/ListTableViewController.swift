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

class ListTableViewController: UITableViewController {

    var data = [CellData]()

    override func viewDidLoad() {
        super.viewDidLoad()

        data = [CellData.init(image: UIImage(named: "cat.png"), infomation: "Cute cat!!!")]

        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")

        self.tableView.rowHeight = UITableView.automaticDimension

        self.tableView.estimatedRowHeight = 200
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
}
