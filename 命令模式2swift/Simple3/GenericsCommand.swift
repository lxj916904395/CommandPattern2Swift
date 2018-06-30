
//
//  GenericsCommand.swift
//  命令模式2swift
//
//  Created by lxj on 2018/6/30.
//  Copyright © 2018年 zhongding. All rights reserved.
//

import Foundation
//泛型命令
class GenericsCommand<T>: TMCommandProtocol {
    private var receiver:T
    private var block:(T)->Void
    init(receiver:T,block:@escaping(T)->Void) {
        self.block = block
        self.receiver = receiver
    }
    
    class func createCommand(receiver:T, block:@escaping (T)->Void) -> TMCommandProtocol{
        return GenericsCommand(receiver: receiver, block: block)
    }
    
    
    func execute() {
        self.block(self.receiver)
    }
}
