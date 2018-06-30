//
//  WrapperCommandInvoker.swift
//  命令模式2swift
//
//  Created by lxj on 2018/6/30.
//  Copyright © 2018年 zhongding. All rights reserved.
//

import Foundation

class WrapperCommandInvoker: NSObject {
    private var receiver:TMMachie
    
    private var commands = Array<TMCommandProtocol>()
    
    init(reveiver:TMMachie) {
        self.receiver = reveiver
    }
    
    
    func toLeft(){
        self.receiver.toLeft(s: "")
        addCommands(method: TMMachie.toLeft)
    }
    
    func toRight(){
        self.receiver.toRight(s: "")
        addCommands(method: TMMachie.toRight)
    }
    
    func addCommands(method:@escaping (TMMachie)->(String)->()){
        self.commands.append(DynamicCommand(receiver: self.receiver, block: { (tm) in
            method(tm)("")
        }))
    }
    
    func undo(){
        if self.commands.count > 0 {
            self.commands.removeLast().execute()
        }
    }
    
    func undoAll(){
        //一次就把所有命令撤销
        WrapperCommand(commands: self.commands).execute()
    }
}
