//
//  GameOverNode.swift
//  CrazyDrive
//
//  Created by Ana Vitoria do Valle Costa on 5/31/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverNode: SKSpriteNode {
    required init?(coder aDecoder: NSCoder) {
        // Swift requires this initializer to exist
        fatalError("init(coder:) has not been implemented")
    }
    
    init(score: Int, frame: CGRect) {
        if score > NSUserDefaults.standardUserDefaults().integerForKey("high score"){
            NSUserDefaults.standardUserDefaults().setInteger(score, forKey: "high score")
        }
        
        super.init(texture: nil, color: UIColor.blackColor(), size: frame.size)
        self.anchorPoint = CGPointZero
        self.position = CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame))
        self.zPosition = 10
        
        let textNode = SKLabelNode(text: "Game Over")
        textNode.name = "text"
        textNode.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame) + 100)
        textNode.fontName = FONT_NAME
        textNode.fontSize = FONT_SIZE_GAME_OVER
        self.addChild(textNode)
        
        let highScoreText = SKLabelNode(text: "High Score: " )
        highScoreText.name = "high_score"
        highScoreText.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
        highScoreText.fontName = FONT_NAME
        highScoreText.fontSize = FONT_SIZE_SCORE
        highScoreText.fontColor = UIColor.whiteColor()
        highScoreText.zPosition = 11
        self.addChild(highScoreText)
        
        let scoreText = SKLabelNode(text: "Score: " + String(score))
        scoreText.name = "high_score"
        scoreText.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame) - 50)
        scoreText.fontName = FONT_NAME
        scoreText.fontSize = FONT_SIZE_SCORE
        self.addChild(scoreText)
    }
}