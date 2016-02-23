//
//  Draw.swift
//  MathExpert
//
//  Created by Mariya Dychko on 2/22/16.
//  Copyright © 2016 Mariya Dychko. All rights reserved.
//

import UIKit

class Draw2D: UIView {
    
    let pointsCounts: CGFloat = 100.0;
    let onePointPix: CGFloat = 50.0;
    var zeroPoint:(x: CGFloat, y:CGFloat)!
    override func drawRect(rect: CGRect)
    {
        zeroPoint = (x:self.frame.size.width/4.0, y: self.frame.size.height - self.frame.size.height/4.0)
        makeCoordinate()
        drawGraph()
    }
    
    func makeCoordinate() {
            let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 2.0)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let components: [CGFloat] = [0.0, 0.0, 0.0, 1.0]
        let color = CGColorCreate(colorSpace, components)
        CGContextSetStrokeColorWithColor(context, color)

        // make X
        let firstPointX: (x:CGFloat, y:CGFloat) = (30.0,self.frame.size.height - self.frame.size.height/4.0 )
        let secondPointX: (x:CGFloat, y:CGFloat) = (self.frame.size.width - 30.0,self.frame.size.height - self.frame.size.height/4.0 )
        CGContextMoveToPoint(context, firstPointX.x, firstPointX.y)
        CGContextAddLineToPoint(context, secondPointX.x, secondPointX.y)
        // make y
        let firstPointY: (x:CGFloat, y:CGFloat) = (self.frame.size.width/4.0,30.0 )
        let secondPointY: (x:CGFloat, y:CGFloat) = (self.frame.size.width/4.0,self.frame.size.height-30 )
        CGContextMoveToPoint(context, firstPointY.x, firstPointY.y)
        CGContextAddLineToPoint(context, secondPointY.x, secondPointY.y)
        // make arrow Y
        let firstPointYArrow: (x:CGFloat, y:CGFloat) = (firstPointY.x+5.0,firstPointY.y+10.0 )
        let secondPointYArrow: (x:CGFloat, y:CGFloat) = (firstPointY.x-5.0,firstPointY.y+10.0 )
        CGContextMoveToPoint(context, firstPointY.x, firstPointY.y)
        CGContextAddLineToPoint(context, firstPointYArrow.x, firstPointYArrow.y)
        CGContextMoveToPoint(context, firstPointY.x, firstPointY.y)
        CGContextAddLineToPoint(context, secondPointYArrow.x, secondPointYArrow.y)
        // make arrow X
        let firstPointXArrow: (x:CGFloat, y:CGFloat) = (secondPointX.x - 10.0,secondPointX.y-5.0 )
        let secondPointXArrow: (x:CGFloat, y:CGFloat) = (secondPointX.x - 10.0, secondPointX.y+5.0 )
        CGContextMoveToPoint(context, secondPointX.x, secondPointX.y)
        CGContextAddLineToPoint(context, firstPointXArrow.x, firstPointXArrow.y)
        CGContextMoveToPoint(context, secondPointX.x, secondPointX.y)
        CGContextAddLineToPoint(context, secondPointXArrow.x, secondPointXArrow.y)
        // xy
        
        CGContextStrokePath(context);

    }
    func graphFunction(x: CGFloat) -> CGFloat {
        return pow(x, 2)
    }
    
    func changePoint(x: CGFloat, y: CGFloat) -> (x: CGFloat, y: CGFloat)  {
        let xReturn = x*self.onePointPix + zeroPoint.x
        let yReturn = zeroPoint.y - y*self.onePointPix
        return (x: xReturn, y: yReturn)
    }
    
    func drawGraph() {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 2.0)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let components: [CGFloat] = [0.0, 0.0, 0.0, 1.0]
        let color = CGColorCreate(colorSpace, components)
        CGContextSetStrokeColorWithColor(context, color)

        let point = changePoint(0,y: graphFunction(0))
        CGContextMoveToPoint(context, point.x, point.y)
        for var i:CGFloat = 0; i < 10.0; i += 0.1 {
            let point = changePoint(CGFloat(i),y: graphFunction(CGFloat(i)))
            if point.y > 30 {
                CGContextAddLineToPoint(context, point.x, point.y) }
            
        }
        CGContextStrokePath(context);

    }
}
