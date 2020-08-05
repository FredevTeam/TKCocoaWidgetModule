//
//  TKMouseEnterOrExitView.swift
//  TKCocoaWidgetModule
//
//  Created by 抓猫的鱼 on 2020/8/4.
//

import Foundation




public class TKMouseEnterOrExitView: NSView {

    private var trackingArea: NSTrackingArea?
    public var mouseEnteredCallBlock:((_ event:NSEvent)-> Void)?
    public var mouseExitedCallBlock:((_ event:NSEvent)-> Void)?

  
}
// MARK: system function
extension TKMouseEnterOrExitView {
    public override func mouseEntered(with event: NSEvent) {
        super.mouseEntered(with: event)
        mouseEnteredCallBlock?(event)
    }
    public override func mouseExited(with event: NSEvent) {
        super.mouseExited(with: event)
        mouseExitedCallBlock?(event)
    }
    
    public override func updateTrackingAreas() {
        super.updateTrackingAreas()
        if let t = trackingArea {
            removeTrackingArea(t)
        }
        trackingArea = NSTrackingArea.init(rect: self.bounds, options: [
            .inVisibleRect,
            .activeAlways,
            .mouseEnteredAndExited
            ], owner: self, userInfo: nil)
        if let t = trackingArea {
            addTrackingArea(t)
        }
    }
}
