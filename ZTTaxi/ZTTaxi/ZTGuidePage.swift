//
//  ZTGuidePage.swift
//  ZTTaxi
//
//  Created by zt on 16/3/5.
//  Copyright © 2016年 zt. All rights reserved.
//

import UIKit
import AVFoundation

class ZTGuidePage: ZTBasePage {

    @IBOutlet var backImageView: UIImageView?
    @IBOutlet var backView: UIView?

    
    var player:AVPlayer!
    var playerItem:AVPlayerItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPlayVideo()
        
        doAnimation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    func doAnimation ()
    {
        var images:[UIImage] = []
        var image:UIImage?
        var imageName:String?
        
        for var index = 0;index<=67;index++ {
            imageName = "logo-" + String(format: "%03d", index)
            
            image = UIImage(named: imageName!)
            
            images.insert(image!, atIndex: index)
        }
        backImageView?.animationImages = images
        backImageView?.animationRepeatCount = 1
        backImageView?.animationDuration = 5
        
        backImageView?.startAnimating()
        
        UIView.animateWithDuration(0.7, delay:5, options: .CurveEaseOut, animations: {
            self.backView!.alpha = 1.0
            self.player?.play()
            }, completion: {
                finished in
                print("Animation End")
        })
    
    }
    func initPlayVideo()
    {
        let path = NSBundle.mainBundle().pathForResource("welcome_video", ofType: "mp4")
        let url = NSURL.fileURLWithPath(path!)
        
        playerItem = AVPlayerItem(URL: url)
        player = AVPlayer(playerItem: playerItem)
        
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = backView!.bounds
        playerLayer.videoGravity =  AVLayerVideoGravityResizeAspect
        
        backView!.layer.insertSublayer(playerLayer, atIndex: 0)
        backView!.alpha = 0.0
        
        NSNotificationCenter.defaultCenter().addObserver ( self,
            selector: "didFinishVideo:" ,
            name: AVPlayerItemDidPlayToEndTimeNotification ,
            object: playerItem)
    }
 
    func didFinishVideo(sender: NSNotification )
    {
        let item = sender.object as! AVPlayerItem
        
        item.seekToTime(kCMTimeZero)
        
        self.player.play()
    }



}
