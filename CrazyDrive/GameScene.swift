//
//  GameScene.swift
//  CrazyDrive
//
//  Created by Ana Vitoria do Valle Costa on 5/30/16.
//  Copyright (c) 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var lastLocation:CGPoint = CGPointMake(0, 0)
    var shape: Shape?
    var intervalToNextHole = 0
    var gameStarted = false
    var tutorialLabel = UILabel(frame: CGRectMake(0, 0, 400, 40))
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        //Setup background
        let BGImage = imageManager.backgroundImage()
        let BGTexture = SKTexture(image: BGImage)
        let background = SKSpriteNode(texture: BGTexture)
        background.xScale = 5
        background.yScale = 5
        background.zPosition = -1
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(background)
        
        //Setup truck
        let truckImage = imageManager.truckImage()
        let truckTexture = SKTexture(image: truckImage)
        let truck = SKSpriteNode(texture: truckTexture)
        truck.xScale = 2
        truck.yScale = 2
        truck.position = CGPointMake(truck.size.width, truck.size.height + 150)
        self.addChild(truck)
        
        //Setup gesture recognizer
        self.view?.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(detectPan)))
        
        //Setup samples
        let square = Shape(type: 1, shapeC: GROUND_COLOR)
        square.position = CGPointMake(CGRectGetMaxX(self.frame) - 100, CGRectGetMaxY(self.frame) - 150)
        self.addChild(square)
        
        let polygon = Shape(type: 2, shapeC: GROUND_COLOR)
        polygon.position = CGPointMake(CGRectGetMaxX(self.frame) - 100, CGRectGetMaxY(self.frame) - 250)
        self.addChild(polygon)
        
        let triangle = Shape(type: 3, shapeC: GROUND_COLOR)
        triangle.position = CGPointMake(CGRectGetMaxX(self.frame) - 100, CGRectGetMaxY(self.frame) - 350)
        self.addChild(triangle)
        
        let ditriangle = Shape(type: 4, shapeC: GROUND_COLOR)
        ditriangle.position = CGPointMake(CGRectGetMaxX(self.frame) - 100, CGRectGetMaxY(self.frame) - 450)
        self.addChild(ditriangle)
        
        //Setup tutorial
        tutorialLabel.textColor = UIColor.blackColor()
        tutorialLabel.text = "Drag shapes to fill the holes in the ground and help the driver in his tip!" + "\n" + "Tap to start"
        tutorialLabel.numberOfLines = 0
        tutorialLabel.font = UIFont(name: "Chalkduster", size: 18 )
        tutorialLabel.sizeToFit()
        tutorialLabel.textAlignment = NSTextAlignment.Center
        tutorialLabel.center.x = self.view!.center.x
        tutorialLabel.center.y = self.view!.center.y - 100
        self.view!.addSubview(tutorialLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        if gameStarted{
        if let location = touches.first?.locationInNode(self) {
            let node = self.nodeAtPoint(location)
            if let s = node as? Shape{
                shape = s;
            }
        }
        }else{
            tutorialLabel.removeFromSuperview()
            gameStarted = true
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if gameStarted{
        if intervalToNextHole == 0 {
            let hole = Hole(type: randomShapeType())
            hole.position = CGPointMake(CGRectGetMaxX(self.frame) + hole.size.width , 185)
            self.addChild(hole)
            hole.name = "hole"
            intervalToNextHole = Int(randomInterval())
            
        }else {
            intervalToNextHole = intervalToNextHole - 1
        }
        
        self.enumerateChildNodesWithName("hole") {
            node, stop in
            if node.position.x < 0 {
                node.removeFromParent()
            }else {
                node.position.x = node.position.x - SPEED
            }
        }
        }
    }
    
    func detectPan(recognizer:UIPanGestureRecognizer) {
        let translation  = recognizer.translationInView(self.view!)
        if shape != nil{
            shape!.position = CGPointMake(shape!.position.x + translation.x, shape!.position.y - translation.y)
        }
    }
    
    func random (loweRange: UInt32, higherRange: UInt32) -> UInt32 {
        let random = arc4random_uniform(higherRange - loweRange) + loweRange
        return random
    }
    
    func randomInterval() -> Int {
        return Int(random(MIN_INTERVAL, higherRange: MAX_INTERVAL))
    }
    
    func randomShapeType() -> Int {
        return Int(random(1, higherRange: 4))
    }
}
