//
//  PopTriangleController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2022/9/22.
//  Copyright © 2022 lym. All rights reserved.
//

import UIKit

class PopTriangleController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let pathView = PathView(frame: CGRect(x: 0, y: 0, width: 80, height: 200))
        view.addSubview(pathView)
        pathView.center = view.center
    }
}

/// 画pop view选择框，直播选礼物数量
private class PathView: UIView {
    override func draw(_ rect: CGRect) {
        // Drawing code

        let lineWidth = 2.0
        let strokeColor = UIColor.red
        let rect1 = CGRect(x: lineWidth,
                           y: lineWidth,
                           width: rect.width - lineWidth * 2.0,
                           height: rect.height - lineWidth)

        let triangleWH = 8.0

        let minX = rect1.minX
        let midX = rect1.midX
        let maxX = rect1.maxX
        let minY = rect1.minY
        let maxY = rect1.maxY
        let bottom = maxY - triangleWH

        let context = UIGraphicsGetCurrentContext()
        context?.setLineCap(.round)
        context?.setLineJoin(.round)
        context?.setLineWidth(lineWidth)

        context?.beginPath()
        context?.move(to: CGPoint(x: midX + triangleWH, y: bottom))
        context?.addLine(to: CGPoint(x: midX, y: maxY))
        context?.addLine(to: CGPoint(x: midX - triangleWH, y: bottom))

        context?.addArc(tangent1End: CGPoint(x: minX, y: bottom),
                       tangent2End: CGPoint(x: minX, y: minY),
                       radius: triangleWH)
        context?.addArc(tangent1End: CGPoint(x: minX, y: minY),
                       tangent2End: CGPoint(x: maxX, y: minY),
                       radius: triangleWH)
        context?.addArc(tangent1End: CGPoint(x: maxX, y: minY),
                       tangent2End: CGPoint(x: maxX, y: bottom),
                       radius: triangleWH)
        context?.addArc(tangent1End: CGPoint(x: maxX, y: bottom),
                       tangent2End: CGPoint(x: midX, y: bottom),
                       radius: triangleWH)
        context?.closePath()

        context?.setStrokeColor(strokeColor.cgColor)
        context?.strokePath()

//        context?.setFillColor(UIColor.orange.cgColor)
//        context?.fillPath()
    }
}

/* oc
 - (void)drawRect:(CGRect)rect {
     CGFloat lineWidth = 2.0;
     CGRect rect1 = CGRectMake(lineWidth, lineWidth, rect.size.width - 2*lineWidth, rect.size.height - lineWidth);
     UIColor *strokeColor = [UIColor redColor];

     // Drawing code
     CGFloat maxX = CGRectGetMaxX(rect1);
     CGFloat midX = CGRectGetMidX(rect1);
     CGFloat minX = CGRectGetMinX(rect1);
     CGFloat maxY = CGRectGetMaxY(rect1);
     CGFloat minY = CGRectGetMinY(rect1);
     CGFloat triangleWH = 8;
     CGFloat bottom = maxY - triangleWH;

     CGContextRef context = UIGraphicsGetCurrentContext();
     CGContextSetLineCap(context, kCGLineCapRound);
     CGContextSetLineJoin(context, kCGLineJoinRound);
     CGContextSetLineWidth(context, lineWidth);
     CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
     CGContextBeginPath(context);

     CGContextMoveToPoint(context, midX + triangleWH, bottom);
     CGContextAddLineToPoint(context, midX, maxY);
     CGContextAddLineToPoint(context, midX - triangleWH, bottom);

     CGContextAddArcToPoint(context, minX, bottom, minX, minY, triangleWH);
     CGContextAddArcToPoint(context, minX, minY, maxX, minY, triangleWH);
     CGContextAddArcToPoint(context, maxX, minY, maxX, maxX, triangleWH);
     CGContextAddArcToPoint(context, maxX, bottom, midX, bottom, triangleWH);
     CGContextClosePath(context);
     CGContextStrokePath(context);
 }
  */
