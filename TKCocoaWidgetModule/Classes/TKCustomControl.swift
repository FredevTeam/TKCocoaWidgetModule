//
//  TKCustomControl.swift
//  TKCocoaWidgetModule
//
//  Created by 抓猫的鱼 on 2020/8/4.
//

import Foundation


public class TKCustomControl: NSControl {
    
    public override var acceptsFirstResponder: Bool {
       return true
   }

    public override func becomeFirstResponder() -> Bool {
       return true
   }


    public override func mouseDown(with event: NSEvent) {
       window?.makeFirstResponder(self)
   }

    public override func mouseUp(with event: NSEvent) {
       if let action = action {
           NSApp.sendAction(action, to: target, from: self)
       }
   }


    public override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
//       NSColor.white.set()
//       NSBezierPath(roundedRect: bounds.insetBy(dx: 1, dy: 1), xRadius: 3, yRadius: 3).fill()
//
//       if window?.firstResponder == self {
//           NSColor.keyboardFocusIndicatorColor.set()
//       } else {
//           NSColor.black.set()
//       }
//       NSBezierPath(roundedRect: bounds.insetBy(dx: 1, dy: 1), xRadius: 3, yRadius: 3).stroke()
   }


    public override var focusRingMaskBounds: NSRect {
       return bounds.insetBy(dx: 1, dy: 1)
   }


    public override func drawFocusRingMask() {
        super.drawFocusRingMask()
//       NSBezierPath(roundedRect: bounds.insetBy(dx: 1, dy: 1), xRadius: 3, yRadius: 3).fill()
   }
    
}
