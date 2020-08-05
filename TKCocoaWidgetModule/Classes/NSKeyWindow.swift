//
//  NSKeyWindow.swift
//  TKCocoaWidgetModule
//
//  Created by 抓猫的鱼 on 2020/8/4.
//

import Foundation

public class NSKeyWindow: NSWindow {
    public override var canBecomeKey: Bool {
        get {
            return true
        }
    }
}
