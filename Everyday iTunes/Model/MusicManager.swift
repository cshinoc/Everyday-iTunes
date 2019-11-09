//
//  MusicManager.swift
//  Everyday iTunes
//
//  Created by 白鳃 Cc on 11/8/19.
//  Copyright © 2019 白鳃 Cc. All rights reserved.
//

import Foundation

struct Result: Codable {
    let artistName: String
    let name: String
    let artworkUrl100: String
}

struct Feed: Codable {
    let results: [Result]
}

struct TopSongs: Codable {
    let feed: Feed
}

protocol MusicManagerDelegate {
    func didUpdateMusicData(top50: [Result])
}

class MusicManager {

    init() {}
    static let shared = MusicManager()

    let songURL = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-songs/all/50/explicit.json")
    var delegate: MusicManagerDelegate?

    func performRequest() {
        let session = URLSession(configuration: .default)

        // Give session a task
        let task = session.dataTask(with: songURL!) { (data, response, error) in
            if (error != nil) {
                print(error!)
                return
            }

            if let safedata = data {
                let top50 = self.parseJSON(topSongs: safedata)
                self.delegate?.didUpdateMusicData(top50: top50)
            }
        }

        // Start the task
        task.resume()
    }

    func parseJSON(topSongs: Data) -> [Result]{
        let decoder = JSONDecoder()

        var top50 = [Result]()

        do {
            let decodedData = try decoder.decode(TopSongs.self, from: topSongs)
            for result in decodedData.feed.results {
                top50.append(result)
            }
            print("!!!!!!!!\(top50[1].artistName)")
            return top50
        } catch {
            print(error)
            return [Result]()
        }

    }


}
