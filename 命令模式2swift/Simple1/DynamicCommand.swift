
//
//  DynamicCommand.swift
//  命令模式2swift
//
//  Created by lxj on 2018/6/30.
//  Copyright © 2018年 zhongding. All rights reserved.
//

import Foundation


/// 动态命令
class DynamicCommand: TMCommandProtocol {
    private var receiver :TMMachie
    private var block:(TMMachie)->Void
    
    init(receiver:TMMachie,block:@escaping (TMMachie)->Void) {
        self.receiver = receiver
        self.block = block
    }
    
    class func createCommand(receiver:TMMachie,block:@escaping (TMMachie)->Void)->TMCommandProtocol {
        return DynamicCommand(receiver: receiver, block: block)
    }
    
    func execute() {
        self.block(self.receiver)
    }
    
}

