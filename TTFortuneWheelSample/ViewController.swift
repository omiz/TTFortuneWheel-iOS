//
//  ViewController.swift
//  TTFortuneWheelSample
//
//  Created by Efraim Budusan on 10/31/17.
//  Copyright © 2017 Tapptitude. All rights reserved.
//

import UIKit
import TTFortuneWheel

class ViewController: UIViewController {
    
    var got100 = false
    var slices = [CarnivalWheelSlice]()

    @IBOutlet weak var spinningWheel: TTFortuneWheel!
    override func viewDidLoad() {
        super.viewDidLoad()
        slices = [ CarnivalWheelSlice.init(title: "  50$"),
                   CarnivalWheelSlice.init(title: "  20$"),
                   CarnivalWheelSlice.init(title: "  10$"),
                   CarnivalWheelSlice.init(title: "  20$"),
                   CarnivalWheelSlice.init(title: "  50$"),
                   CarnivalWheelSlice.init(title: "  10$"),
                   CarnivalWheelSlice.init(title: "  20$"),
                   CarnivalWheelSlice.init(title: "  50$"),
                   CarnivalWheelSlice.init(title: "  20$"),
                   CarnivalWheelSlice.init(title: "  100$"),
                   CarnivalWheelSlice.init(title: "  20$"),
                   CarnivalWheelSlice.init(title: "  10$")]
        spinningWheel.slices = slices
        spinningWheel.equalSlices = true
        spinningWheel.frameStroke.width = 0
        spinningWheel.slices.enumerated().forEach { (pair) in
            let slice = pair.element as! CarnivalWheelSlice
            let offset = pair.offset
            switch offset % 4 {
            case 0: slice.style = .brickRed
            case 1: slice.style = .sandYellow
            case 2: slice.style = .babyBlue
            case 3: slice.style = .deepBlue
            default: slice.style = .brickRed
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rotateButton(_ sender: Any) {
        
        let count = spinningWheel.slices.count

        spinningWheel.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            var finish = Int.random(in: 0..<count)
            
            if finish == 0, self.got100 {
                finish = Int.random(in: 0..<count)
            }
            
            self.spinningWheel.startAnimating(fininshIndex: finish) { (finished) in
                if finish == 0 {
                    self.got100 = true
                }
                print("\n\nfinish = \(finish)")
                print(self.spinningWheel.slices[finish].title)
            }
        }
    }
}

