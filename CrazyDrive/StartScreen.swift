//
//  StartScreen.swift
//  Crazy Drive
//
//  Created by Dorsa Norouzi on 5/30/16.
//  Copyright © 2016 Dorsa Norouzi, Ana Costa. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class StartScreen: SKScene {
    let startLabel = SKLabelNode(fontNamed:"Chalkduster")
    
    override func didMoveToView(view: SKView) {
        startLabel.fontColor = UIColor.whiteColor()
        self.backgroundColor = UIColor.blackColor()
        startLabel.text = "Touch to start"
        startLabel.fontSize = 50
        startLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) )
        self.addChild(startLabel)
        
        //help sign
        //change
        let help = SKSpriteNode(texture: SKTexture(image: imageManager.imageForHelpSymbol()))
        help.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 70)
        help.name = "help"
        help.xScale = 2
        help.yScale = 2
        self.addChild(help)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        let nodes = self.nodesAtPoint(touchLocation)
        var help = false
        for node in nodes {
            if node.name == "help" {
                if let scene = GameScene(fileNamed:"GameScene") {
                    // Configure the view.
                    let skView = self.view
                    skView!.showsFPS = false
                    skView!.showsNodeCount = false
                    
                    /* Sprite Kit applies additional optimizations to improve rendering performance */
                    skView!.ignoresSiblingOrder = true
                    
                    /* Set the scale mode to scale to fit the window */
                    scene.scaleMode = .AspectFill
                    
                    skView!.presentScene(scene)
                }
            }
        }
        
        if !help {
            let scene = GameScene()
            let skView = self.view
            skView!.ignoresSiblingOrder = true
            scene.scaleMode = .ResizeFill
            scene.size = (size: skView!.bounds.size)
            skView!.presentScene(scene)
        }
        
    }
}
