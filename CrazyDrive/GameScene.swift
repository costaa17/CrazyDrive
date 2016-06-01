//
//  GameScene.swift
//  CrazyDrive
//
//  Created by Ana Vitoria do Valle Costa on 5/30/16.
//  Copyright (c) 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import SpriteKit

class GameScene: SKScene,SKPhysicsContactDelegate {
    var lastLocation:CGPoint = CGPointMake(0, 0)
    var shape: Sample?
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
        truck.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(truck.frame.size.width - 115, truck.frame.size.height))
        truck.physicsBody?.categoryBitMask = TRUCK_CATEGORY
        truck.physicsBody?.collisionBitMask = 0
        truck.physicsBody?.contactTestBitMask = HOLE_CATEGORY
        self.addChild(truck)
        
        //Setup gesture recognizer
        //self.view?.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(detectPan)))
        
        //Setup samples
        let square = Sample(type: 1)
        square.position = getSamplePosition(square)
        square.zPosition = 2
        self.addChild(square)
        
        let polygon = Sample(type: 2)
        polygon.position = getSamplePosition(polygon)
        polygon.zPosition = 2
        self.addChild(polygon)
        
        let triangle = Sample(type: 3)
        triangle.position = getSamplePosition(triangle)
        triangle.zPosition = 2
        self.addChild(triangle)
        
        let ditriangle = Sample(type: 4)
        ditriangle.position = getSamplePosition(ditriangle)
        ditriangle.zPosition = 2
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
        
        //Setup physics world
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        let bodies = getOrderedBodies(contact)
        if bodies.firstBody.categoryBitMask == TRUCK_CATEGORY &&
            bodies.secondBody.categoryBitMask == HOLE_CATEGORY {
            print("lose")
        }else{
            let shape1 = bodies.firstBody.node as! Shape
            let shape2 = bodies.secondBody.node as! Shape
            if(shape1.type == shape2.type){
            bodies.firstBody.node?.removeFromParent()
            }
        }
    }
    
    private func getOrderedBodies(contact: SKPhysicsContact) -> (firstBody: SKPhysicsBody, secondBody: SKPhysicsBody) {
        var firstBody: SKPhysicsBody!
        var secondBody: SKPhysicsBody!
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        return (firstBody, secondBody)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        if gameStarted{
            if let location = touches.first?.locationInNode(self) {
                let node = self.nodeAtPoint(location)
                if let s = node as? Sample{
                    shape = s;
                }
            }
        }else{
            tutorialLabel.removeFromSuperview()
            gameStarted = true
        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let touchPosition = touch.locationInNode(self)
            if shape != nil{
                shape?.position = touchPosition
            }
        }
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if shape != nil{
        shape!.position = getSamplePosition(shape!)
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
                hole.zPosition = 1
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
    
    /*func detectPan(recognizer:UIPanGestureRecognizer) {
     let translation  = recognizer.translationInView(self.view!)
     if shape != nil{
     shape!.position = CGPointMake(shape!.position.x + translation.x, shape!.position.y - translation.y)
     }
     }*/
    
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
    
    func getSamplePosition(sample: Sample) -> CGPoint {
        return CGPointMake(CGRectGetMaxX(self.frame) - 100, CGRectGetMaxY(self.frame) - 50 - CGFloat(100 * sample.type))
    }
    
}
