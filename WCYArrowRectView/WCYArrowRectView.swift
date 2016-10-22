//
//  WCYArrowRectView.swift
//  WCYArrowRectView
//
//  Created by wuchuanyu on 16/6/3.
//  Copyright © 2016年 wuchuanyu. All rights reserved.
//

import UIKit

@objc
public enum WCYArrowPosition : Int {
    case topLeft
    case topMiddle
    case topRight
    case bottomLeft
    case bottomMiddle
    case bottomRight
    case leftTop
    case leftMiddle
    case leftBottom
    case rightTop
    case rightMiddle
    case rightBottom
}

@IBDesignable
class WCYArrowRectView: UIView {
    /// 箭头位置：上下左右
    @IBInspectable var arrowPos: WCYArrowPosition = .topLeft
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
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        var path: CGPath
        switch arrowPos {
        case .topLeft:
            path = topLeftPath()
        case .topMiddle:
            path = topMiddlePath()
        case .topRight:
            path = topRightPath()
        case .bottomLeft:
            path = bottomLeftPath()
        case .bottomMiddle:
            path = bottomMiddlePath()
        case .bottomRight:
            path = bottomRightPath()
        case .leftTop:
            path = leftTopPath()
        case .leftMiddle:
            path = leftMiddlePath()
        case .leftBottom:
            path = leftBottomPath()
        case .rightTop:
            path = rightTopPath()
        case .rightMiddle:
            path = rightMiddlePath()
        case .rightBottom:
            path = rightBottomPath()
        }
        
        let ctx = UIGraphicsGetCurrentContext()
        if let ctx = ctx {
            ctx.beginPath()
            ctx.setFillColor(fillColor.cgColor)
            ctx.addPath(path)
            ctx.fillPath()
            
            ctx.beginPath()
            ctx.setLineWidth(strokeWidth)
            ctx.setStrokeColor(strokeColor.cgColor)
            let lengths = [dotLineWidth, dotLineSpace]
            ctx.setLineDash(phase: 0, lengths: lengths)
            ctx.addPath(path)
            ctx.strokePath()
        }
    }
    
    fileprivate func topLeftPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = self.frame.width
        let height = self.frame.height
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: minX + corner, y: minY + arrowHeight))
        //arrow
        path.addLine(to: CGPoint(x: arrowOffset, y: minY + arrowHeight))
        path.addLine(to: CGPoint(x: arrowOffset + arrowWidth/2, y: minY))
        path.addLine(to: CGPoint(x: arrowOffset + arrowWidth, y: minY + arrowHeight))
        //arrow end
        path.addLine(to: CGPoint(x: maxX - corner, y: minY + arrowHeight))
        path.addArc(tangent1End: CGPoint(x: maxX, y: minY + arrowHeight), tangent2End: CGPoint(x: maxX, y: minY + corner + arrowHeight), radius: corner)
        path.addLine(to: CGPoint(x: maxX, y: maxY - corner))
        path.addArc(tangent1End: CGPoint(x: maxX, y: maxY), tangent2End: CGPoint(x: maxX - corner, y: maxY), radius: corner)
        path.addLine(to: CGPoint(x: corner, y: maxY))
        path.addArc(tangent1End: CGPoint(x: minX, y: maxY), tangent2End: CGPoint(x: minX, y: maxY - corner), radius: corner)
        path.addLine(to: CGPoint(x: minX, y: corner + arrowHeight))
        path.addArc(tangent1End: CGPoint(x: minX, y: minY + arrowHeight), tangent2End: CGPoint(x: minX + corner, y: minY + arrowHeight), radius: corner)
        path.closeSubpath()
        return path
    }
    
    fileprivate func topMiddlePath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = self.frame.width
        let height = self.frame.height
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: minX + corner, y: minY + arrowHeight))
        //arrow
        path.addLine(to: CGPoint(x: (minX+maxX)/2 - arrowWidth/2, y: minY + arrowHeight))
        path.addLine(to: CGPoint(x: (minX+maxX)/2, y: minY))
        path.addLine(to: CGPoint(x: (minX+maxX)/2 + arrowWidth/2, y: minY + arrowHeight))
        //arrow end
        path.addLine(to: CGPoint(x: maxX - corner, y: minY + arrowHeight))
        path.addArc(tangent1End: CGPoint(x: maxX, y: minY + arrowHeight), tangent2End: CGPoint(x: maxX, y: minY + corner + arrowHeight), radius: corner)
        path.addLine(to: CGPoint(x: maxX, y: maxY - corner))
        path.addArc(tangent1End: CGPoint(x: maxX, y: maxY), tangent2End: CGPoint(x: maxX - corner, y: maxY), radius: corner)
        path.addLine(to: CGPoint(x: corner, y: maxY))
        path.addArc(tangent1End: CGPoint(x: minX, y: maxY), tangent2End: CGPoint(x: minX, y: maxY - corner), radius: corner)
        path.addLine(to: CGPoint(x: minX, y: corner + arrowHeight))
        path.addArc(tangent1End: CGPoint(x: minX, y: minY + arrowHeight), tangent2End: CGPoint(x: minX + corner, y: minY + arrowHeight), radius: corner)
        path.closeSubpath()
        return path
    }
    
    fileprivate func topRightPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = self.frame.width
        let height = self.frame.height
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: minX + corner, y: minY + arrowHeight))
        //arrow
        path.addLine(to: CGPoint(x: maxX-arrowOffset-arrowWidth, y: minY + arrowHeight))
        path.addLine(to: CGPoint(x: maxX-arrowOffset-arrowWidth + arrowWidth/2, y: minY))
        path.addLine(to: CGPoint(x: maxX-arrowOffset-arrowWidth + arrowWidth, y: minY + arrowHeight))
        //arrow end
        path.addLine(to: CGPoint(x: maxX - corner, y: minY + arrowHeight))
        path.addArc(tangent1End: CGPoint(x: maxX, y: minY + arrowHeight), tangent2End: CGPoint(x: maxX, y: minY + corner + arrowHeight), radius: corner)
        path.addLine(to: CGPoint(x: maxX, y: maxY - corner))
        path.addArc(tangent1End: CGPoint(x: maxX, y: maxY), tangent2End: CGPoint(x: maxX - corner, y: maxY), radius: corner)
        path.addLine(to: CGPoint(x: corner, y: maxY))
        path.addArc(tangent1End: CGPoint(x: minX, y: maxY), tangent2End: CGPoint(x: minX, y: maxY - corner), radius: corner)
        path.addLine(to: CGPoint(x: minX, y: corner + arrowHeight))
        path.addArc(tangent1End: CGPoint(x: minX, y: minY + arrowHeight), tangent2End: CGPoint(x: minX + corner, y: minY + arrowHeight), radius: corner)
        path.closeSubpath()
        return path
    }
    
    fileprivate func bottomLeftPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = self.frame.width
        let height = self.frame.height
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: minX + corner, y: minY))
        path.addLine(to: CGPoint(x: maxX - corner, y: minY))
        path.addArc(tangent1End: CGPoint(x: maxX, y: minY), tangent2End: CGPoint(x: maxX, y: corner + minY), radius: corner)
        path.addLine(to: CGPoint(x: maxX, y: maxY - corner - arrowHeight))
        path.addArc(tangent1End: CGPoint(x: maxX, y: maxY - arrowHeight), tangent2End: CGPoint(x: maxX - corner, y: maxY - arrowHeight), radius: corner)
        //arrow
        path.addLine(to: CGPoint(x: arrowOffset + arrowWidth, y: maxY - arrowHeight))
        path.addLine(to: CGPoint(x: arrowOffset + arrowWidth/2, y: maxY))
        path.addLine(to: CGPoint(x: arrowOffset, y: maxY - arrowHeight))
        //arrow end
        path.addLine(to: CGPoint(x: corner, y: maxY - arrowHeight))
        path.addArc(tangent1End: CGPoint(x: minX, y: maxY - arrowHeight), tangent2End: CGPoint(x: minX, y: maxY - corner - arrowHeight), radius: corner)
        path.addLine(to: CGPoint(x: minX, y: corner))
        path.addArc(tangent1End: CGPoint(x: minX, y: minY), tangent2End: CGPoint(x: minX + corner, y: minY), radius: corner)
        path.closeSubpath()
        return path
    }
    
    fileprivate func bottomMiddlePath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = self.frame.width
        let height = self.frame.height
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: minX + corner, y: minY))
        path.addLine(to: CGPoint(x: maxX - corner, y: minY))
        path.addArc(tangent1End: CGPoint(x: maxX, y: minY), tangent2End: CGPoint(x: maxX, y: corner + minY), radius: corner)
        path.addLine(to: CGPoint(x: maxX, y: maxY - corner - arrowHeight))
        path.addArc(tangent1End: CGPoint(x: maxX, y: maxY - arrowHeight), tangent2End: CGPoint(x: maxX - corner, y: maxY - arrowHeight), radius: corner)
        //arrow
        path.addLine(to: CGPoint(x: (minX+maxX)/2 + arrowWidth/2, y: maxY - arrowHeight))
        path.addLine(to: CGPoint(x: (minX+maxX)/2, y: maxY))
        path.addLine(to: CGPoint(x: (minX+maxX)/2 - arrowWidth/2, y: maxY - arrowHeight))
        //arrow end
        path.addLine(to: CGPoint(x: corner, y: maxY - arrowHeight))
        path.addArc(tangent1End: CGPoint(x: minX, y: maxY - arrowHeight), tangent2End: CGPoint(x: minX, y: maxY - corner - arrowHeight), radius: corner)
        path.addLine(to: CGPoint(x: minX, y: corner))
        path.addArc(tangent1End: CGPoint(x: minX, y: minY), tangent2End: CGPoint(x: minX + corner, y: minY), radius: corner)
        path.closeSubpath()
        return path
    }
    
    fileprivate func bottomRightPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = self.frame.width
        let height = self.frame.height
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: minX + corner, y: minY))
        path.addLine(to: CGPoint(x: maxX - corner, y: minY))
        path.addArc(tangent1End: CGPoint(x: maxX, y: minY), tangent2End: CGPoint(x: maxX, y: corner + minY), radius: corner)
        path.addLine(to: CGPoint(x: maxX, y: maxY - corner - arrowHeight))
        path.addArc(tangent1End: CGPoint(x: maxX, y: maxY - arrowHeight), tangent2End: CGPoint(x: maxX - corner, y: maxY - arrowHeight), radius: corner)
        //arrow
        path.addLine(to: CGPoint(x: maxX - arrowOffset, y: maxY - arrowHeight))
        path.addLine(to: CGPoint(x: maxX - arrowOffset - arrowWidth/2, y: maxY))
        path.addLine(to: CGPoint(x: maxX - arrowOffset - arrowWidth, y: maxY - arrowHeight))
        //arrow end
        path.addLine(to: CGPoint(x: corner, y: maxY - arrowHeight))
        path.addArc(tangent1End: CGPoint(x: minX, y: maxY - arrowHeight), tangent2End: CGPoint(x: minX, y: maxY - corner - arrowHeight), radius: corner)
        path.addLine(to: CGPoint(x: minX, y: corner))
        path.addArc(tangent1End: CGPoint(x: minX, y: minY), tangent2End: CGPoint(x: minX + corner, y: minY), radius: corner)
        path.closeSubpath()
        return path
    }
    
    fileprivate func leftTopPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = self.frame.width
        let height = self.frame.height
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: minX + corner + arrowHeight, y: minY))
        path.addLine(to: CGPoint(x: maxX - corner, y: minY))
        path.addArc(tangent1End: CGPoint(x: maxX, y: minY), tangent2End: CGPoint(x: maxX, y: corner + minY), radius: corner)
        path.addLine(to: CGPoint(x: maxX, y: maxY - corner))
        path.addArc(tangent1End: CGPoint(x: maxX, y: maxY), tangent2End: CGPoint(x: maxX - corner, y: maxY), radius: corner)
        path.addLine(to: CGPoint(x: corner + arrowHeight, y: maxY))
        path.addArc(tangent1End: CGPoint(x: arrowHeight, y: maxY), tangent2End: CGPoint(x: arrowHeight, y: maxY - corner), radius: corner)
        //arrow
        path.addLine(to: CGPoint(x: arrowHeight, y: arrowOffset + arrowWidth))
        path.addLine(to: CGPoint(x: minX, y: arrowOffset + arrowWidth/2))
        path.addLine(to: CGPoint(x: arrowHeight, y: arrowOffset))
        //arrow end
        path.addLine(to: CGPoint(x: arrowHeight, y: corner))
        path.addArc(tangent1End: CGPoint(x: arrowHeight, y: minY), tangent2End: CGPoint(x: corner + arrowHeight, y: minY), radius: corner)
        path.closeSubpath()
        return path
    }
    
    fileprivate func leftMiddlePath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = self.frame.width
        let height = self.frame.height
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: minX + corner + arrowHeight, y: minY))
        path.addLine(to: CGPoint(x: maxX - corner, y: minY))
        path.addArc(tangent1End: CGPoint(x: maxX, y: minY), tangent2End: CGPoint(x: maxX, y: corner + minY), radius: corner)
        path.addLine(to: CGPoint(x: maxX, y: maxY - corner))
        path.addArc(tangent1End: CGPoint(x: maxX, y: maxY), tangent2End: CGPoint(x: maxX - corner, y: maxY), radius: corner)
        path.addLine(to: CGPoint(x: corner + arrowHeight, y: maxY))
        path.addArc(tangent1End: CGPoint(x: arrowHeight, y: maxY), tangent2End: CGPoint(x: arrowHeight, y: maxY - corner), radius: corner)
        //arrow
        path.addLine(to: CGPoint(x: arrowHeight, y: (minY+maxY)/2 + arrowWidth/2))
        path.addLine(to: CGPoint(x: minX, y: (minY+maxY)/2))
        path.addLine(to: CGPoint(x: arrowHeight, y: (minY+maxY)/2 - arrowWidth/2))
        //arrow end
        path.addLine(to: CGPoint(x: arrowHeight, y: corner))
        path.addArc(tangent1End: CGPoint(x: arrowHeight, y: minY), tangent2End: CGPoint(x: corner + arrowHeight, y: minY), radius: corner)
        path.closeSubpath()
        return path
    }
    
    fileprivate func leftBottomPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = self.frame.width
        let height = self.frame.height
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: minX + corner + arrowHeight, y: minY))
        path.addLine(to: CGPoint(x: maxX - corner, y: minY))
        path.addArc(tangent1End: CGPoint(x: maxX, y: minY), tangent2End: CGPoint(x: maxX, y: corner + minY), radius: corner)
        path.addLine(to: CGPoint(x: maxX, y: maxY - corner))
        path.addArc(tangent1End: CGPoint(x: maxX, y: maxY), tangent2End: CGPoint(x: maxX - corner, y: maxY), radius: corner)
        path.addLine(to: CGPoint(x: corner + arrowHeight, y: maxY))
        path.addArc(tangent1End: CGPoint(x: arrowHeight, y: maxY), tangent2End: CGPoint(x: arrowHeight, y: maxY - corner), radius: corner)
        //arrow
        path.addLine(to: CGPoint(x: arrowHeight, y: maxY - arrowOffset))
        path.addLine(to: CGPoint(x: minX, y: maxY - arrowOffset - arrowWidth/2))
        path.addLine(to: CGPoint(x: arrowHeight, y: maxY - arrowOffset - arrowWidth))
        //arrow end
        path.addLine(to: CGPoint(x: arrowHeight, y: corner))
        path.addArc(tangent1End: CGPoint(x: arrowHeight, y: minY), tangent2End: CGPoint(x: corner + arrowHeight, y: minY), radius: corner)
        path.closeSubpath()
        return path
    }
    
    fileprivate func rightTopPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = self.frame.width
        let height = self.frame.height
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: minX + corner, y: minY))
        path.addLine(to: CGPoint(x: maxX - corner - arrowHeight, y: minY))
        path.addArc(tangent1End: CGPoint(x: maxX - arrowHeight, y: minY), tangent2End: CGPoint(x: maxX - arrowHeight, y: corner + minY), radius: corner)
        //arrow
        path.addLine(to: CGPoint(x: maxX - arrowHeight, y: arrowOffset))
        path.addLine(to: CGPoint(x: maxX, y: arrowOffset + arrowWidth/2))
        path.addLine(to: CGPoint(x: maxX - arrowHeight, y: arrowOffset + arrowWidth))
        //arrow end
        path.addLine(to: CGPoint(x: maxX - arrowHeight, y: maxY - corner))
        path.addArc(tangent1End: CGPoint(x: maxX - arrowHeight, y: maxY), tangent2End: CGPoint(x: maxX - arrowHeight - corner, y: maxY), radius: corner)
        path.addLine(to: CGPoint(x: corner, y: maxY))
        path.addArc(tangent1End: CGPoint(x: minX, y: maxY), tangent2End: CGPoint(x: minX, y: maxY - corner), radius: corner)
        path.addLine(to: CGPoint(x: minX, y: corner))
        path.addArc(tangent1End: CGPoint(x: minX, y: minY), tangent2End: CGPoint(x: minX + corner, y: minY), radius: corner)
        path.closeSubpath()
        return path
    }
    
    fileprivate func rightMiddlePath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = self.frame.width
        let height = self.frame.height
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: minX + corner, y: minY))
        path.addLine(to: CGPoint(x: maxX - corner - arrowHeight, y: minY))
        path.addArc(tangent1End: CGPoint(x: maxX - arrowHeight, y: minY), tangent2End: CGPoint(x: maxX - arrowHeight, y: corner + minY), radius: corner)
        //arrow
        path.addLine(to: CGPoint(x: maxX - arrowHeight, y: (minY+maxY)/2 - arrowWidth/2))
        path.addLine(to: CGPoint(x: maxX, y: (minY+maxY)/2))
        path.addLine(to: CGPoint(x: maxX - arrowHeight, y: (minY+maxY)/2 + arrowWidth/2))
        //arrow end
        path.addLine(to: CGPoint(x: maxX - arrowHeight, y: maxY - corner))
        path.addArc(tangent1End: CGPoint(x: maxX - arrowHeight, y: maxY), tangent2End: CGPoint(x: maxX - arrowHeight - corner, y: maxY), radius: corner)
        path.addLine(to: CGPoint(x: corner, y: maxY))
        path.addArc(tangent1End: CGPoint(x: minX, y: maxY), tangent2End: CGPoint(x: minX, y: maxY - corner), radius: corner)
        path.addLine(to: CGPoint(x: minX, y: corner))
        path.addArc(tangent1End: CGPoint(x: minX, y: minY), tangent2End: CGPoint(x: minX + corner, y: minY), radius: corner)
        path.closeSubpath()
        return path
    }
    
    fileprivate func rightBottomPath() -> CGPath {
        let corner: CGFloat = self.corner
        let width = self.frame.width
        let height = self.frame.height
        let minX = strokeWidth/2
        let maxX = width - strokeWidth/2
        let minY = strokeWidth/2
        let maxY = height - strokeWidth/2
        let path = CGMutablePath()
        path.move(to: CGPoint(x: minX + corner, y: minY))
        path.addLine(to: CGPoint(x: maxX - corner - arrowHeight, y: minY))
        path.addArc(tangent1End: CGPoint(x: maxX - arrowHeight, y: minY), tangent2End: CGPoint(x: maxX - arrowHeight, y: corner + minY), radius: corner)
        //arrow
        path.addLine(to: CGPoint(x: maxX - arrowHeight, y: maxY - arrowOffset - arrowWidth))
        path.addLine(to: CGPoint(x: maxX, y: maxY - arrowOffset - arrowWidth/2))
        path.addLine(to: CGPoint(x: maxX - arrowHeight, y: maxY - arrowOffset))
        //arrow end
        path.addLine(to: CGPoint(x: maxX - arrowHeight, y: maxY - corner))
        path.addArc(tangent1End: CGPoint(x: maxX - arrowHeight, y: maxY), tangent2End: CGPoint(x: maxX - arrowHeight - corner, y: maxY), radius: corner)
        path.addLine(to: CGPoint(x: corner, y: maxY))
        path.addArc(tangent1End: CGPoint(x: minX, y: maxY), tangent2End: CGPoint(x: minX, y: maxY - corner), radius: corner)
        path.addLine(to: CGPoint(x: minX, y: corner))
        path.addArc(tangent1End: CGPoint(x: minX, y: minY), tangent2End: CGPoint(x: minX + corner, y: minY), radius: corner)
        path.closeSubpath()
        return path
    }
}
