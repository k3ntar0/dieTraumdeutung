//
//  ViewController.swift
//  dieTraumdeutung
//
//  Created by k3ntar0 on 2019/10/14.
//  Copyright © 2019 k3ntar0. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    var videoPlayer:AVPlayer?
    var videoPlayerLayer:AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElement()
        setUpVideo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        videoPlayer?.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        videoPlayer?.pause()
    }
    
    func setUpElement() {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(logInButton)
    }
    
    func setUpVideo() {
        
        let bundlePath = Bundle.main.path(forResource: "Launch", ofType: "mov")
        guard bundlePath != nil else { return }
        let url = URL(fileURLWithPath: bundlePath!)
        let item = AVPlayerItem(url: url)
        
        videoPlayer = AVPlayer(playerItem: item)
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        videoPlayerLayer?.frame = view.bounds
        videoPlayerLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPlayer?.playImmediately(atRate: 1)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // Loop the video
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { [weak self] note in self?.videoPlayer?.seek(to: CMTime.zero)
            self?.videoPlayer?.play()
        }
    }


}

