//
//  TopListTableViewController.swift
//  Everyday iTunes
//
//  Created by 白鳃 Cc on 11/9/19.
//  Copyright © 2019 白鳃 Cc. All rights reserved.
//

import Foundation
import UIKit

class TopListTableViewController: UITableViewController {

    var urlString: String?

    // To support parse different json url
    init(urlString: String?) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var task: URLSessionDownloadTask!
    var session: URLSession!
    var cache: NSCache<AnyObject, AnyObject>!
    var refreshCont: UIRefreshControl! // Can refresh the table
    var tableData: [AnyObject]!

    override func viewDidLoad() {
        super.viewDidLoad()

        session = URLSession.shared
        task = URLSessionDownloadTask()

        // Load the content first
        updateTableView()

        self.refreshCont = UIRefreshControl()
        self.refreshCont.addTarget(self, action: #selector(TopListTableViewController.updateTableView), for: .valueChanged)
        self.refreshControl = self.refreshCont

        // Collected from json
        tableData = []

        self.cache = NSCache()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "custom")

        self.tableView.rowHeight = UITableView.automaticDimension

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "custom")

        let dict = tableData[indexPath.row] as! [String: AnyObject]

        cell.textLabel!.text = dict["name"] as? String
        cell.detailTextLabel!.text = dict["artistName"] as? String
        cell.detailTextLabel!.textColor = UIColor.gray

        // show the placeholder image as default if the url image hasn't been loaded
        cell.imageView?.image = UIImage(named: "placeholder")
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.layer.cornerRadius = 5
        cell.imageView?.clipsToBounds = true

        if (self.cache.object(forKey: indexPath.row as AnyObject) != nil) {

            print("No need to download")
            // Use cached image directly
            cell.imageView?.image = self.cache.object(forKey: indexPath.row as AnyObject) as? UIImage

        } else {
            let artworkURL = dict["artworkUrl100"] as! String

            let imageURL: URL! = URL(string: artworkURL)

            task = session.downloadTask(with: imageURL, completionHandler: { (address: URL?, response: URLResponse?, error: Error?) -> Void in

                // download image
                if let data = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async (execute: { () -> Void in

                        if let updateCell = tableView.cellForRow(at: indexPath) {
                            let img: UIImage! = UIImage(data: data)
                            updateCell.imageView?.image = img
                            self.cache.setObject(img, forKey: (indexPath.row) as AnyObject)
                        }
                    })
                }
            })

            task.resume()
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    @objc func updateTableView() {
        let songURL: URL! = URL(string: self.urlString!)

        task = session.downloadTask(with: songURL, completionHandler: { (address: URL?, response: URLResponse?, error: Error?) -> Void in

            if address != nil {
                let data:Data! = try? Data(contentsOf: address!)
                do {
                    let dic = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as AnyObject

                    let feed = dic["feed"] as AnyObject
                    self.tableData = feed.value(forKey : "results") as? [AnyObject]


                    DispatchQueue.main.async(execute: { () -> Void in
                        self.tableView.reloadData()

                        self.refreshControl?.endRefreshing()
                    })
                } catch {
                    print(error)
                }
            }
        })

        task.resume()
    }
    
}
