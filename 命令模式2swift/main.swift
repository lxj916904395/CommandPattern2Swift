//
//  main.swift
//  命令模式2swift
//
//  Created by zhongding on 2018/6/26.
//  Copyright © 2018年 zhongding. All rights reserved.
//

import Foundation

print("Hello, World!")

let tm = TMMachie()

let leftCommand = TMLeftCommand(tm)

let rightCommand = TMRightCommand(tm)

let manager = TMMachineManager(left: leftCommand,right: rightCommand)

manager.toLeft()
manager.toRight()
manager.toRight()
manager.toRight()

manager.recallAll()

