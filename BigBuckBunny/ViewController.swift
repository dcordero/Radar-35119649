//
//  ViewController.swift
//  BigBuckBunny
//
//  Created by David Cordero on 23.10.17.
//  Copyright © 2017 David Cordero. All rights reserved.
//

import AVKit
import AVFoundation
import UIKit

class ViewController: UIViewController {

    private var playerViewController: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        play(stream: URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)
    }

    // MARK: - Private
    
    private func setUpView() {
        playerViewController = AVPlayerViewController()
        playerViewController.view.frame = view.bounds
        addChildViewController(playerViewController)
        view.addSubview(playerViewController.view)
    }
    
    private func play(stream: URL) {
        let asset = AVAsset(url: stream)
        let playetItem = AVPlayerItem(asset: asset)
        playerViewController.player = AVPlayer(playerItem: playetItem)
        playerViewController.player?.play()
        playerViewController.player?.currentItem?.externalMetadata = metaData()
    }
    
    private func metaData() -> [AVMetadataItem] {
        var metadataItems: [AVMetadataItem] = []
        
        let metadataTitle = createMetadataItem(identifier: AVMetadataIdentifier.commonIdentifierTitle.rawValue, value: "Big Buck Bunny" as NSCopying & NSObjectProtocol)
        metadataItems.append(metadataTitle)
        
        let metadataDescription = createMetadataItem(identifier: AVMetadataIdentifier.commonIdentifierDescription.rawValue, value: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage" as NSCopying & NSObjectProtocol)
        metadataItems.append(metadataDescription)
        
        return metadataItems
    }
    
    private func createMetadataItem(identifier: String, value: (NSCopying & NSObjectProtocol)?) -> AVMutableMetadataItem {
        let item = AVMutableMetadataItem()
        item.identifier = AVMetadataIdentifier(rawValue: identifier)
        item.value = value
        item.locale = .current
        return item
    }
}

