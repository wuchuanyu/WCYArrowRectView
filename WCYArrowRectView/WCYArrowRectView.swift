//
//  WCYArrowRectView.swift
//  WCYArrowRectView
//
//  Created by wuchuanyu on 16/6/3.
//  Copyright © 2016年 wuchuanyu. All rights reserved.
//

import UIKit

enum WCYArrowPosition : Int {
    case TopLeft
    case TopRight
    case BottomLeft
    case BottomRight
    case LeftTop
    case LeftBottom
    case RightTop
    case RightBottom
}

@IBDesignable
class WCYArrowRectView: UIView {
    /// 箭头位置：上下左右
    @IBInspectable var arrowPos: WCYArrowPosition = .TopLeft
    /// 箭头宽
    @IBInspectable var arrowWidth: CGFloat = 10.0
    /// 箭头高
    @IBInspectable var arrowHeight: CGFloat = 6.0
    /// 箭头偏移量
    @IBInspectable var arrowOffset: CGFloat = 20.0
    /// 边线颜色
    @IBInspectable var strokeColor: UIColor = UIColor(red: 215/255.0, green: 215/255.0, blue: 215/255.0, alpha: 1.0)
    /// 填充颜色
    @IBInspectable var fillColor: UIColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
    /// 圆角
    @IBInspectable var corner: CGFloat = 8.0
    /// 虚线线宽
    @IBInspectable var dotLineWidth: CGFloat = 3.0
    /// 虚线间隔，若边线为实线，只需将这个值设置成0
    @IBInspectable var dotLineSpace: CGFloat = 2.0
    /// 线宽
    @IBInspectable var strokeWidth: CGFloat = 1.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        var path: CGPath
        switch arrowPos {
        case .TopLeft:
            path = topLeftPath()
        case .TopRight:
            path = topRightPath()
        case .BottomLeft:
            path = bottomLeftPath()
        case .BottomRight:
            path = bottomRightPath()
        case .LeftTop:
            path = leftTopPath()
        case .LeftBottom:
            path = leftBottomPath()
        case .RightTop:
            path = rightTopPath()
        case .RightBottom:
            path = rightBottomPath()
        }
        
        let ctx = UIGraphicsGetCurrentContext()
        
        CGContextBeginPath(ctx)
        CGContextSetFillColorWithColor(ctx, fillColor.CGColor)
        CGContextAddPath(ctx, path)
        CGContextFillPath(ctx)
        
        CGContextBeginPath(ctx)
        CGContextSetLineWidth(ctx, strokeWidth)
        CGContextSetStrokeColorWithColor(ctx, strokeColor.CGColor)
        let lengths = [dotLineWidth, dotLineSpace]
        CGContextSetLineDash(ctx, 0, lengths, 2)
        CGContextAddPath(ctx, path)
        CGContextStrokePath(ctx)
    }
    
    private func topLeftPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = CGRectGetWidth(self.frame)
        let height = CGRectGetHeight(self.frame)
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, minX + corner, minY + arrowHeight)
        //arrow
        CGPathAddLineToPoint(path, nil, arrowOffset, minY + arrowHeight)
        CGPathAddLineToPoint(path, nil, arrowOffset + arrowWidth/2, minY)
        CGPathAddLineToPoint(path, nil, arrowOffset + arrowWidth, minY + arrowHeight)
        //arrow end
        CGPathAddLineToPoint(path, nil, maxX - corner , minY + arrowHeight)
        CGPathAddArcToPoint(path, nil, maxX , minY + arrowHeight, maxX, minY + corner + arrowHeight, corner)
        CGPathAddLineToPoint(path, nil, maxX , maxY - corner)
        CGPathAddArcToPoint(path, nil, maxX, maxY, maxX - corner, maxY, corner)
        CGPathAddLineToPoint(path, nil, corner, maxY)
        CGPathAddArcToPoint(path, nil, minX, maxY, minX, maxY - corner, corner)
        CGPathAddLineToPoint(path, nil, minX, corner + arrowHeight)
        CGPathAddArcToPoint(path, nil, minX, minY + arrowHeight, minX + corner, minY + arrowHeight, corner)
        CGPathCloseSubpath(path)
        return path
    }
    
    private func topRightPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = CGRectGetWidth(self.frame)
        let height = CGRectGetHeight(self.frame)
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, minX + corner, minY + arrowHeight)
        //arrow
        CGPathAddLineToPoint(path, nil, maxX-arrowOffset-arrowWidth, minY + arrowHeight)
        CGPathAddLineToPoint(path, nil, maxX-arrowOffset-arrowWidth + arrowWidth/2, minY)
        CGPathAddLineToPoint(path, nil, maxX-arrowOffset-arrowWidth + arrowWidth, minY + arrowHeight)
        //arrow end
        CGPathAddLineToPoint(path, nil, maxX - corner , minY + arrowHeight)
        CGPathAddArcToPoint(path, nil, maxX , minY + arrowHeight, maxX, minY + corner + arrowHeight, corner)
        CGPathAddLineToPoint(path, nil, maxX , maxY - corner)
        CGPathAddArcToPoint(path, nil, maxX, maxY, maxX - corner, maxY, corner)
        CGPathAddLineToPoint(path, nil, corner, maxY)
        CGPathAddArcToPoint(path, nil, minX, maxY, minX, maxY - corner, corner)
        CGPathAddLineToPoint(path, nil, minX, corner + arrowHeight)
        CGPathAddArcToPoint(path, nil, minX, minY + arrowHeight, minX + corner, minY + arrowHeight, corner)
        CGPathCloseSubpath(path)
        return path
    }
    
    private func bottomLeftPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = CGRectGetWidth(self.frame)
        let height = CGRectGetHeight(self.frame)
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, minX + corner, minY)
        CGPathAddLineToPoint(path, nil, maxX - corner, minY)
        CGPathAddArcToPoint(path, nil, maxX, minY, maxX, corner + minY, corner)
        CGPathAddLineToPoint(path, nil, maxX, maxY - corner - arrowHeight)
        CGPathAddArcToPoint(path, nil, maxX, maxY - arrowHeight, maxX - corner, maxY - arrowHeight, corner)
        //arrow
        CGPathAddLineToPoint(path, nil, arrowOffset + arrowWidth, maxY - arrowHeight)
        CGPathAddLineToPoint(path, nil, arrowOffset + arrowWidth/2, maxY)
        CGPathAddLineToPoint(path, nil, arrowOffset, maxY - arrowHeight)
        //arrow end
        CGPathAddLineToPoint(path, nil, corner, maxY - arrowHeight)
        CGPathAddArcToPoint(path, nil, minX, maxY - arrowHeight, minX, maxY - corner - arrowHeight, corner)
        CGPathAddLineToPoint(path, nil, minX, corner)
        CGPathAddArcToPoint(path, nil, minX, minY, minX + corner, minY, corner)
        CGPathCloseSubpath(path)
        return path
    }
    
    private func bottomRightPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = CGRectGetWidth(self.frame)
        let height = CGRectGetHeight(self.frame)
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, minX + corner, minY)
        CGPathAddLineToPoint(path, nil, maxX - corner, minY)
        CGPathAddArcToPoint(path, nil, maxX, minY, maxX, corner + minY, corner)
        CGPathAddLineToPoint(path, nil, maxX, maxY - corner - arrowHeight)
        CGPathAddArcToPoint(path, nil, maxX, maxY - arrowHeight, maxX - corner, maxY - arrowHeight, corner)
        //arrow
        CGPathAddLineToPoint(path, nil, maxX - arrowOffset, maxY - arrowHeight)
        CGPathAddLineToPoint(path, nil, maxX - arrowOffset - arrowWidth/2, maxY)
        CGPathAddLineToPoint(path, nil, maxX - arrowOffset - arrowWidth, maxY - arrowHeight)
        //arrow end
        CGPathAddLineToPoint(path, nil, corner, maxY - arrowHeight)
        CGPathAddArcToPoint(path, nil, minX, maxY - arrowHeight, minX, maxY - corner - arrowHeight, corner)
        CGPathAddLineToPoint(path, nil, minX, corner)
        CGPathAddArcToPoint(path, nil, minX, minY, minX + corner, minY, corner)
        CGPathCloseSubpath(path)
        return path
    }
    
    private func leftTopPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = CGRectGetWidth(self.frame)
        let height = CGRectGetHeight(self.frame)
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, minX + corner + arrowHeight, minY)
        CGPathAddLineToPoint(path, nil, maxX - corner, minY)
        CGPathAddArcToPoint(path, nil, maxX, minY, maxX, corner + minY, corner)
        CGPathAddLineToPoint(path, nil, maxX, maxY - corner)
        CGPathAddArcToPoint(path, nil, maxX, maxY, maxX - corner, maxY, corner)
        CGPathAddLineToPoint(path, nil, corner + arrowHeight, maxY)
        CGPathAddArcToPoint(path, nil, arrowHeight, maxY, arrowHeight, maxY - corner, corner)
        //arrow
        CGPathAddLineToPoint(path, nil, arrowHeight, arrowOffset + arrowWidth)
        CGPathAddLineToPoint(path, nil, minX, arrowOffset + arrowWidth/2)
        CGPathAddLineToPoint(path, nil, arrowHeight, arrowOffset)
        //arrow end
        CGPathAddLineToPoint(path, nil, arrowHeight, corner)
        CGPathAddArcToPoint(path, nil, arrowHeight, minY, corner + arrowHeight, minY, corner)
        CGPathCloseSubpath(path)
        return path
    }
    
    private func leftBottomPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = CGRectGetWidth(self.frame)
        let height = CGRectGetHeight(self.frame)
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, minX + corner + arrowHeight, minY)
        CGPathAddLineToPoint(path, nil, maxX - corner, minY)
        CGPathAddArcToPoint(path, nil, maxX, minY, maxX, corner + minY, corner)
        CGPathAddLineToPoint(path, nil, maxX, maxY - corner)
        CGPathAddArcToPoint(path, nil, maxX, maxY, maxX - corner, maxY, corner)
        CGPathAddLineToPoint(path, nil, corner + arrowHeight, maxY)
        CGPathAddArcToPoint(path, nil, arrowHeight, maxY, arrowHeight, maxY - corner, corner)
        //arrow
        CGPathAddLineToPoint(path, nil, arrowHeight, maxY - arrowOffset)
        CGPathAddLineToPoint(path, nil, minX, maxY - arrowOffset - arrowWidth/2)
        CGPathAddLineToPoint(path, nil, arrowHeight, maxY - arrowOffset - arrowWidth)
        //arrow end
        CGPathAddLineToPoint(path, nil, arrowHeight, corner)
        CGPathAddArcToPoint(path, nil, arrowHeight, minY, corner + arrowHeight, minY, corner)
        CGPathCloseSubpath(path)
        return path
    }
    
    private func rightTopPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = CGRectGetWidth(self.frame)
        let height = CGRectGetHeight(self.frame)
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, minX + corner, minY)
        CGPathAddLineToPoint(path, nil, maxX - corner - arrowHeight, minY)
        CGPathAddArcToPoint(path, nil, maxX - arrowHeight, minY, maxX - arrowHeight, corner + minY, corner)
        //arrow
        CGPathAddLineToPoint(path, nil, maxX - arrowHeight, arrowOffset)
        CGPathAddLineToPoint(path, nil, maxX, arrowOffset + arrowWidth/2)
        CGPathAddLineToPoint(path, nil, maxX - arrowHeight, arrowOffset + arrowWidth)
        //arrow end
        CGPathAddLineToPoint(path, nil, maxX - arrowHeight, maxY - corner)
        CGPathAddArcToPoint(path, nil, maxX - arrowHeight, maxY, maxX - arrowHeight - corner, maxY, corner)
        CGPathAddLineToPoint(path, nil, corner, maxY)
        CGPathAddArcToPoint(path, nil, minX, maxY, minX, maxY - corner, corner)
        CGPathAddLineToPoint(path, nil, minX, corner)
        CGPathAddArcToPoint(path, nil, minX, minY, minX + corner, minY, corner);
        CGPathCloseSubpath(path)
        return path
    }
    
    private func rightBottomPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = CGRectGetWidth(self.frame)
        let height = CGRectGetHeight(self.frame)
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, minX + corner, minY)
        CGPathAddLineToPoint(path, nil, maxX - corner - arrowHeight, minY)
        CGPathAddArcToPoint(path, nil, maxX - arrowHeight, minY, maxX - arrowHeight, corner + minY, corner)
        //arrow
        CGPathAddLineToPoint(path, nil, maxX - arrowHeight, maxY - arrowOffset - arrowWidth)
        CGPathAddLineToPoint(path, nil, maxX, maxY - arrowOffset - arrowWidth/2)
        CGPathAddLineToPoint(path, nil, maxX - arrowHeight, maxY - arrowOffset)
        //arrow end
        CGPathAddLineToPoint(path, nil, maxX - arrowHeight, maxY - corner)
        CGPathAddArcToPoint(path, nil, maxX - arrowHeight, maxY, maxX - arrowHeight - corner, maxY, corner)
        CGPathAddLineToPoint(path, nil, corner, maxY)
        CGPathAddArcToPoint(path, nil, minX, maxY, minX, maxY - corner, corner)
        CGPathAddLineToPoint(path, nil, minX, corner)
        CGPathAddArcToPoint(path, nil, minX, minY, minX + corner, minY, corner);
        CGPathCloseSubpath(path)
        return path
    }
}
