//
//  TMRightCommand.swift
//  命令模式2swift
//
//  Created by zhongding on 2018/6/26.
//  Copyright © 2018年 zhongding. All rights reserved.
//

import Foundation
class TMRightCommand: TMCommand {
    
    override func execute() {
        self.tm.toRight(s:"");
    }
}
