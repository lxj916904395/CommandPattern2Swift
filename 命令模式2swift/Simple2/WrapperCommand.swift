
//
//  WrapperCommand.swift
//  命令模式2swift
//
//  Created by lxj on 2018/6/30.
//  Copyright © 2018年 zhongding. All rights reserved.
//

import Foundation
//复合命令-》执行多个命令
class WrapperCommand: TMCommandProtocol {
    
    private var commands:Array<TMCommandProtocol>
    
    init(commands:Array<TMCommandProtocol>) {
        self.commands = commands
    }
    
    func execute() {
        while self.commands.count > 0 {
            self.commands.removeLast().execute()
        }
    }
    
}
