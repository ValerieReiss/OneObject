//
//  GameScene.swift
//  OneObject
//
//  Created by Valerie on 09.03.23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var playButton: SKSpriteNode!
    
    var playableRectArea:CGRect = CGRectZero
    
    override func didMove(to view: SKView) {
        
        let maxAspectRatio:CGFloat = 16.0/9.0
                let playableHeight = size.width / maxAspectRatio
                let playableMargin = (size.height-playableHeight)/2.0
                playableRectArea = CGRect(x: 0, y: playableMargin,
                                              width: size.width,
                                              height: playableHeight)
        
        
        
        
        playButton = SKSpriteNode(imageNamed: "star")
        playButton.name = "star"
        playButton.position = CGPoint(x: self.frame.midX , y: self.frame.midY)
        playButton.zPosition = 0
        playButton.alpha = 1
        
        addChild(playButton)
        
        let original = SKSpriteNode(imageNamed: "original")
            original.size = CGSize(width: 50, height: 50)
            original.zPosition = 0

        let invisible = SKSpriteNode(color: UIColor.cyan, size: CGSizeMake(830, 374))
            invisible.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
            invisible.alpha = 0.2
            invisible.zPosition = -10
            invisible.name = original.name
            invisible.addChild(original)
            self.addChild(invisible)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard var touch = touches.first else {
            return
        }
        touch = (touches.first as UITouch?)!
        let location = touch.location(in: self)
        let node = self.atPoint(location)
        /*
        let pos = touch.location(in: self)
        let node = self.atPoint(pos)*/
        
        if node.name == "star"{
            print ("One Object touched")
        } else if node.name != "star" {
            print ("fail")
        }
    }
}
