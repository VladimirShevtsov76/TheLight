//
//  ViewController.swift
//  The Light
//
//  Created by Vladimir Shevtsov on 23.12.2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var isLightColor = "black";
    override var prefersStatusBarHidden: Bool {
        return true}
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    fileprivate func updateUI() {
        switch  isLightColor {
        case "black":
            view.backgroundColor = .black
        case "white":
            view.backgroundColor = .white
        case "green":
            view.backgroundColor = .green
        case "yellow":
            view.backgroundColor = .yellow
        case "red":
            view.backgroundColor = .red
        default:
            view.backgroundColor = .black
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        switch  isLightColor {
        case "black":
            isLightColor = "white"
        case "white":
            isLightColor = "green"
        case "green":
            isLightColor = "yellow"
        case "yellow":
            isLightColor = "red"
        case "red":
            isLightColor = "black"
          default:
            isLightColor = "black"
        }
        
        updateUI()
    }
    
    func toggleFlash() {
       
            guard let device = AVCaptureDevice.default(for: .video), device.hasTorch else { return }
            
            do {
                try device.lockForConfiguration()

                if device.torchMode == .off {
                    try device.setTorchModeOn(level: AVCaptureDevice.maxAvailableTorchLevel)}
                else {
                    device.torchMode = .off
                        
                    }
                
                device.unlockForConfiguration()
            } catch {
                print("Error: \(error)")
            }
        }
    
    @IBAction func LightChange(_ sender: Any) {
        toggleFlash()
    }
}

