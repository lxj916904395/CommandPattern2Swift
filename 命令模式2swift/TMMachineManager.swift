//
//  TMMachineManager.swift
//  命令模式2swift
//
//  Created by zhongding on 2018/6/26.
//  Copyright © 2018年 zhongding. All rights reserved.
//

import Foundation

class TMMachineManager: NSObject {
    
    private var commands = Array<TMProtocol>()
    private var left:TMLeftCommand
    private var right:TMRightCommand
    
    init(left:TMLeftCommand,right:TMRightCommand) {
        self.left = left
        self.right = right;
    }
    
    func toLeft(){
        self.left.execute()
        commands.append(self.left)
    }
    
    func backToLeft(){
        self.left.execute()
    }
    
    func toRight(){
        self.right.execute();
        commands.append(self.right)
    }
    
    func backToRight(){
        self.right.execute()
    }
    
    //撤销
    func recall(){
        if commands.count>0 {
            
            let target = commands.last
            
            if target is TMLeftCommand {
                
                backToRight()
                
            }else if target is TMRightCommand{
                
                backToLeft()
            }
            
            commands.removeLast()
        }
    }
    
    //撤销全部
    func recallAll(){
        while commands.count>0 {
            recall()
        }
    }
}
