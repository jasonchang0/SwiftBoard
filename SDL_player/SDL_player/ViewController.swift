//
//  ViewController.swift
//  SDL_player
//
//  Created by Jason Chang on 11/3/18.
//  Copyright © 2018 Jason Chang. All rights reserved.
//

import UIKit
import SmartDeviceLink

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    
        var pManager = ProxyManager()
    }
    
    class ProxyManager: NSObject {
        // Manager
        fileprivate var sdlManager: SDLManager!
        
        // Singleton
        static let sharedManager = ProxyManager()
        
        private override init() {
            super.init()
            
            let audioData = "audioFile.pcm";
            
            guard let streamManager = self.sdlManager.streamManager, streamManager.isAudioConnected else { return }
            
            if streamManager.sendAudioData(audioData) == false {
                print("Could not send Audio Data")
            }
            
//            self.sdlManager.streamManager?.audioManager.push(withFileURL: "audioFile.mp3")
//            self.sdlManager.streamManager?.audioManager.playNextWhenReady()
        }
        
        public func audioStreamManager(_ audioManager: SDLAudioStreamManager, errorDidOccurForFile fileURL: URL, error: Error) {
            
        }
        
        public func audioStreamManager(_ audioManager: SDLAudioStreamManager, fileDidFinishPlaying fileURL: URL, successfully: Bool) {
            if audioManager.queue.count != 0 {
                audioManager.playNextWhenReady()
            }
    }


}



