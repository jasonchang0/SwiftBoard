//
//  ViewController.swift
//  car_karaoke
//
//  Created by Jason Chang on 11/3/18.
//  Copyright © 2018 Jason Chang. All rights reserved.
//

import UIKit
//import AudioKitPlaygrounds
import AudioKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testAudioKit()
//        vocalIsolation()
        
        // Create your engine and start the player
        
        
        let engine = AudioEngine("audioFile.mp3")
//        engine.player.play()
//        sleep(185)
        
        let instr = engine.isoInstrumental(engine.file)
        let vocal = engine.isoVocal(engine.file, instr)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testAudioKit() {
        var oscillator = AKOscillator()
        var oscillator2 = AKOscillator()
        
        AudioKit.output = AKMixer(oscillator, oscillator2)
        do {
            try AudioKit.start()
            
        } catch {
             print("Hm, something is wrong here. Try starting the AudioKit.")
        }
        
        oscillator.start()
        
        sleep(100)
    }
    
    /*
    func vocalIsolation() {
        // Declare your nodes as instance variables
        var player: AKPlayer!
        var file: AKAudioFile!
        
        do {
            file = try AKAudioFile(readFileName: "audioFile.mp3")
        } catch {
            AKLog("File Not Found")
            return
        }
        player = AKPlayer(audioFile: file)
        player.isLooping = true
        
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
        
        // Create your engine and start the player
        player.play()
        
        sleep(185)
    } */
    
    
    // Create a class to handle the audio set up
    class AudioEngine {
        
        // Declare your nodes as instance variables
        var player: AKPlayer!
//        var delay: AKDelay!
//        var reverb: AKReverb!
        var file: AKAudioFile!
        var instr: AKAudioFile!
        
        init(_ audioFile: String) {
            // Set up a player to the loop the file's playback
            do {
                file = try AKAudioFile(readFileName: audioFile)
            } catch {
                AKLog("File Not Found")
                return
            }
            
            instr = isoInstrumental(file)
            
            player = AKPlayer(audioFile: file)
            player.isLooping = false
            
            // Next we'll connect the audio player to a delay effect
//            delay = AKDelay(player)
            
            // Set the parameters of the delay here
//            delay.time = 0.1 // seconds
//            delay.feedback = 0.8 // Normalized Value 0 - 1
//            delay.dryWetMix = 0.2 // Normalized Value 0 - 1
            
            // Continue adding more nodes as you wish, for example, reverb:
//            reverb = AKReverb(delay)
//            reverb.loadFactoryPreset(.cathedral)
            
//            AudioKit.output = reverb
            
            /*
            AudioKit.output = player
            
            do {
                try AudioKit.start()
            } catch {
                AKLog("AudioKit did not start!")
            }*/
            
        }
        
        func isoInstrumental(_ input: AKAudioFile) -> AKAudioFile {
//            var leftSignal = AKBooster(input)
//            leftSignal.rightGain = 0
            
            var emptyArray = [Float](repeating: 0.0, count: input.floatChannelData![0].count)
            
            var leftSignal: [Float]! = input.floatChannelData?[0]
            var lArray: [[Float]] = [leftSignal, emptyArray]
            
            do {
                var inputL = try AKAudioFile(createFileFromFloats: lArray)
                
                player = AKPlayer(audioFile: inputL)
                AudioKit.output = inputL.player
                player.isLooping = false
                
                do {
                    try AudioKit.start()
                } catch {
                    AKLog("AudioKit did not start!")
                }
                
                player.play()
                
                sleep(185)
                
            } catch {
                AKLog("Player did not start!")
            }

            
            /*
            do {
                let akAudioFileL = try AKAudioFile(readFileName: "audioFileL.mp3")
            } catch {
                AKLog("File not found!")
            }
            
            try AudioKit.renderToFile(akAudioFileL, duration: leftSignal.rampDuration, prerender: {
                leftSignal.start()
            })*/

//            var rightSignal = AKBooster(input)
//            rightSignal.leftGain = 0
            
            var rightSignal: [Float]! = input.floatChannelData?[1]
            var rArray: [[Float]] = [emptyArray, rightSignal]

            do {
                var inputR = try AKAudioFile(createFileFromFloats: rArray)
                
                player = AKPlayer(audioFile: inputR)
                AudioKit.output = inputR.player
                player.isLooping = false
                
                do {
                    try AudioKit.start()
                } catch {
                    AKLog("AudioKit did not start!")
                }
                
                player.play()
                
                sleep(185)
                
            } catch {
                AKLog("Player did not start!")
            }
            
            /*
            do {
                let akAudioFileR = try AKAudioFile(readFileName: "audioFileR.mp3")
            } catch {
                AKLog("File not found!")
            }
            
            try AudioKit.renderToFile(akAudioFileR, duration: rightSignal.rampDuration, prerender: {
                rightSignal.start()
            })*/
            
            for i in 0...(rightSignal.count-1){
                rightSignal[i] = -rightSignal[i]
            }
            
            var outArray: [[Float]] = [leftSignal, rightSignal]
            var outputFile = input
            
            do {
                var outputFile: AKAudioFile = try AKAudioFile(createFileFromFloats: outArray)
            } catch {
                AKLog("Output was not created!")
            }
            
            
            return outputFile
        }
        
        
        func isoVocal(_ input: AKAudioFile, _ instrumentals: AKAudioFile) -> AKAudioFile {
            var inputLS: [Float]! = input.floatChannelData?[0]
            var inputRS: [Float]! = input.floatChannelData?[1]
            
            var instrLS: [Float]! = instrumentals.floatChannelData?[0]
            var instrRS: [Float]! = instrumentals.floatChannelData?[1]
            
            var outputLS = [Float]()
            var outputRS = [Float]()
            
            for i in 0...(inputLS.count - 1) {
                outputLS += [Float(inputLS[i]) - Float(instrLS[i] * 0.5)]
                outputRS += [Float(inputRS[i]) - Float(instrRS[i] * 0.5)]
            }
            
            var outArray: [[Float]] = [outputLS, outputRS]
            var outputFile = input
            
            do {
                var outputFile: AKAudioFile = try AKAudioFile(createFileFromFloats: outArray)
                self.player = AKPlayer(audioFile: outputFile)
                AudioKit.output = outputFile.player
                
                do {
                    try AudioKit.start()
                } catch {
                    AKLog("AudioKit did not start!")
                }
                
                self.player.play()
                
                print("Here!")
                sleep(185)
            } catch {
                AKLog("Player did not start!")
            }
            
            return outputFile
        }
        
        
    }
    
}





