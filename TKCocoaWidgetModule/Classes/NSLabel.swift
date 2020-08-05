//
//  NSLabel.swift
//  TKCocoaWidgetModule
//
//  Created by 抓猫的鱼 on 2020/8/4.
//

import Cocoa


public class NSLabel: NSTextField {
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.placeholderString = ""
        self.font = NSFont.systemFont(ofSize: 28)
        self.isBordered = false
        self.drawsBackground = false
        self.alignment = .left
        self.focusRingType = .none
        self.isSelectable = false
        self.isEditable = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
