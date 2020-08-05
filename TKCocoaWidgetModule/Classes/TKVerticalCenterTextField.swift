//
//  TKVerticalCenterTextField.swift
//  TKCocoaWidgetModule
//
//  Created by 抓猫的鱼 on 2020/8/5.
//

import Foundation


public class TKVerticalCenterTextField: NSTextField {

    public override func draw(_ dirtyRect: NSRect) {
            super.draw(dirtyRect)
        }
         
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
         
        let cell = RSVerticallyCenteredTextFieldCell(textCell: "")
        cell.isBordered = true
        
        self.cell = cell
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class RSVerticallyCenteredTextFieldCell: NSTextFieldCell {
    var mIsEditingOrSelecting:Bool = false
    
    override func drawingRect(forBounds theRect: NSRect) -> NSRect {
        //Get the parent's idea of where we should draw
        var newRect:NSRect = super.drawingRect(forBounds: theRect)
        
        // When the text field is being edited or selected, we have to turn off the magic because it screws up
        // the configuration of the field editor.  We sneak around this by intercepting selectWithFrame and editWithFrame and sneaking a
        // reduced, centered rect in at the last minute.
        
        if !mIsEditingOrSelecting {
            // Get our ideal size for current text
            let textSize:NSSize = self.cellSize(forBounds: theRect)
            
            //Center in the proposed rect
            let heightDelta:CGFloat = newRect.size.height - textSize.height
            if heightDelta > 0 {
                newRect.size.height -= heightDelta
                newRect.origin.y += heightDelta/2
            }
        }
        
        return newRect
    }
    
    override func titleRect(forBounds rect: NSRect) -> NSRect {
       // call super to get its original rect
       var rect = super.titleRect(forBounds: rect)
       // shift down a little so the draw rect is vertically centered in cell frame
       rect.origin.y += (rect.height - cellSize.height) / 2
       // finally return the new rect
       return rect
     }
    override func select(withFrame rect: NSRect,
                              in controlView: NSView,
                              editor textObj: NSText,
                              delegate: Any?,
                              start selStart: Int,
                              length selLength: Int)//(var aRect: NSRect, inView controlView: NSView, editor textObj: NSText, delegate anObject: AnyObject?, start selStart: Int, length selLength: Int)
    {
        let arect = self.drawingRect(forBounds: rect)
        mIsEditingOrSelecting = true;
        super.select(withFrame: arect, in: controlView, editor: textObj, delegate: delegate, start: selStart, length: selLength)
        mIsEditingOrSelecting = false;
    }
    
    
    override func drawInterior(withFrame cellFrame: NSRect, in controlView: NSView) {
       // call super and pass in our modified frame
       super.drawInterior(withFrame: titleRect(forBounds: cellFrame), in: controlView)
     }
//
//     override func select(withFrame rect: NSRect, in controlView: NSView, editor textObj: NSText, delegate: Any?, start selStart: Int, length selLength: Int) {
//       // call super and pass in our modified frame
//       super.select(withFrame: titleRect(forBounds: rect), in: controlView, editor: textObj, delegate: delegate, start: selStart, length: selLength)
//     }
    
    override func edit(withFrame rect: NSRect,
                            in controlView: NSView,
                            editor textObj: NSText,
                            delegate: Any?,
                            event: NSEvent?)
    {
        let aRect = self.drawingRect(forBounds: rect)
        mIsEditingOrSelecting = true;
        super.edit(withFrame: aRect, in: controlView, editor: textObj, delegate: delegate, event: event)
        mIsEditingOrSelecting = false
    }
}
