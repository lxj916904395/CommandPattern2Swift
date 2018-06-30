//
//  GenericsCommandInvoker.swift
//  命令模式2swift
//
//  Created by lxj on 2018/6/30.
//  Copyright © 2018年 zhongding. All rights reserved.
//

import Foundation

class GenericsCommandInvoker: NSObject {
    private var receiver:TMMachie
    private var commands = Array<TMCommandProtocol>()
    
    init(receiver:TMMachie) {
        self.receiver = receiver
    }
    
    func toLeft(){
        self.receiver.toLeft(s: "")
        addCommand(method: TMMachie.toLeft)
    }
    
    func toRight(){
        self.receiver.toRight(s: "")
        addCommand(method: TMMachie.toRight)
    }
    
    func addCommand(method:@escaping (TMMachie)->(String)->()){
                
        let command = GenericsCommand<TMMachie>(receiver: self.receiver, block: { (tm) in
            if tm is TMMachie {
                method(tm)("")
            }
        })
        self.commands.append(command)
 
        
    }
    
    func undo(){
        if self.commands.count > 0 {
            self.commands.removeLast().execute()
        }
    }
    
    func undoAll(){
        for command in self.commands {
            command.execute()
        }
    }
}
