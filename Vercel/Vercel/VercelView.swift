//
//  VercelView.swift
//  Vercel
//
//  Created by De-Great Yartey on 06/11/2023.
//

import SwiftUI
import ScreenSaver
import AVFoundation

class VercelView: ScreenSaverView {
  private let videoLayer = AVPlayerLayer()
  private var looper: AVPlayerLooper?
  
  override init?(frame: NSRect, isPreview: Bool) {
    super.init(frame: frame, isPreview: isPreview)
    self.commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.commonInit()
  }
  
  override func startAnimation() {
    super.startAnimation()
    videoLayer.player?.play()
  }
  
  override func stopAnimation() {
    super.stopAnimation()
    videoLayer.player?.pause()
  }
  
  private func commonInit() {
    self.animationTimeInterval = 1.0 / 25.0
    self.wantsLayer = true
        
    videoLayer.frame = bounds
    videoLayer.autoresizingMask = [.layerWidthSizable, .layerHeightSizable]
    videoLayer.masksToBounds = true
    videoLayer.needsDisplayOnBoundsChange = true
    videoLayer.contentsGravity = .resizeAspectFill
    videoLayer.backgroundColor = NSColor(red: 0.00, green: 0.01, blue: 0.00, alpha:1.0).cgColor
    videoLayer.videoGravity = .resizeAspectFill
    videoLayer.masksToBounds = true
    
    self.layer = videoLayer
    
    
    let item = AVPlayerItem(url: Bundle(for: VercelView.self).url(forResource: "vercel", withExtension: "mp4")!)
    let player: AVQueuePlayer = AVQueuePlayer(playerItem: item)
    looper = AVPlayerLooper(player: player, templateItem: item)
    
    videoLayer.player = player
  }
}
