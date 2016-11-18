//
//  AudioVC.swift
//  SpotyTest
//
//  Created by David Zavala on 17/11/16.
//  Copyright © 2016 David Zavala. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
class AudioVC: UIViewController {
    
    var image = UIImage()
    var mainSongTitle = String()
    var mainPrevieURl = String()
    
    @IBOutlet weak var Backgroud: UIImageView!
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet var songTitle: UILabel!
    
    @IBOutlet var playpause: UIButton!
    
    override func viewDidLoad() {
        songTitle.text = mainSongTitle
        Backgroud.image = image
        mainImageView.image = image
        downloadFileFromUrl(url: URL(string:mainPrevieURl)!)
        playpause.setTitle("Pause", for: .normal)
    }
    
    func downloadFileFromUrl(url:URL) {
        var downloadTask = URLSessionDownloadTask()
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: {
            customUrl,response,error in
            self.play(url: customUrl!)
        })
        
        downloadTask.resume()
        
    }
    
    func play(url:URL) {
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
        }
        catch{
            print(error)
        }
    }
    @IBAction func pauseplay(_ sender: Any) {
        
        if player.isPlaying {
            player.pause()
            playpause.setTitle("Play", for: .normal)
        }else{
            player.play()
            playpause.setTitle("Pause", for: .normal)
        }
        
    }
    
}
