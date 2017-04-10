//
//  KemonoFriendsPath.swift
//  KemonoFriendsView
//
//  Created by zzk on 2017/4/3.
//  Copyright © 2017年 zzk. All rights reserved.
//

import UIKit

public typealias KemonoFriendsPathComposingClosure = (KemonoFriendsPath, CGRect) -> Void

public enum KemonoFriendsPathComposingStyle: UInt32 {
   
    case style1 = 0, style2, style3, style4, style5
    
    case custom
    
    public static var random: KemonoFriendsPathComposingStyle {
        return KemonoFriendsPathComposingStyle.init(rawValue: arc4random_uniform(5))!
    }
}

open class KemonoFriendsPath: UIBezierPath {
    
    var fillColor: UIColor?
    
    var subtractedFillColor: UIColor?
    
    var composing: KemonoFriendsPathComposingClosure?
    
    private override init() {
        super.init()
    }
    
    private var rect: CGRect = CGRect.zero
    
    var subtractedPath: KemonoFriendsPath {
        let path = KemonoFriendsPath()
        path.move(to: rect.origin)
        path.addLine(to: CGPoint.init(x: rect.maxX, y: rect.origin.y))
        path.addLine(to: CGPoint.init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint.init(x: rect.origin.x, y: rect.maxY))
        path.close()
        path.append(self)
        path.usesEvenOddFillRule = true
        return path
    }

    public convenience init(rect: CGRect, composing: @escaping KemonoFriendsPathComposingClosure) {
        self.init()
        self.rect = rect
        composing(self, rect)
        self.composing = composing
    }
    
    public func recompose(_ composing: KemonoFriendsPathComposingClosure? = nil) {
        self.removeAllPoints()
        let cp = composing ?? self.composing
        cp?(self, rect)
    }
    
    public convenience init(rect: CGRect, style: KemonoFriendsPathComposingStyle) {
        switch style {
        case .style1:
            self.init(rect: rect, composing: KemonoFriendsPath.style1)
        case .style2:
            self.init(rect: rect, composing: KemonoFriendsPath.style2)
        case .style3:
            self.init(rect: rect, composing: KemonoFriendsPath.style3)
        case .style4:
            self.init(rect: rect, composing: KemonoFriendsPath.style4)
        case .style5:
            self.init(rect: rect, composing: KemonoFriendsPath.style5)
        default:
            self.init()
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open static let style1: KemonoFriendsPathComposingClosure = { (path, rect) in
        path.move(to: rect.origin)
        path.addLine(to: CGPoint.init(x: rect.origin.x, y: rect.maxY))
        path.addLine(to: CGPoint.init(x: 1 / 3 * rect.width + rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint.init(x: 1 / 2 * rect.width + rect.minX, y: rect.origin.y))
        path.close()
    }
    
    open static let style2: KemonoFriendsPathComposingClosure = { (path, rect) in
        path.move(to: rect.origin)
        path.addLine(to: CGPoint.init(x: rect.origin.x, y: rect.maxY))
        path.addLine(to: CGPoint.init(x: 1 / 2 * rect.width + rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint.init(x: 1 / 3 * rect.width + rect.minX, y: rect.origin.y))
        path.close()
    }
    open static let style3: KemonoFriendsPathComposingClosure = { (path, rect) in
        path.move(to: CGPoint.init(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint.init(x: rect.maxX, y: rect.minY + 0.6 * rect.height))
        path.addLine(to: CGPoint.init(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint.init(x: rect.minX + 0.4 * rect.width, y: rect.minY))
        path.close()
    }
    
    open static let style4: KemonoFriendsPathComposingClosure = { (path, rect) in
        path.move(to: CGPoint.init(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint.init(x: rect.minX, y: rect.minY + 0.4 * rect.height))
        path.addLine(to: CGPoint.init(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint.init(x: rect.minX + 0.6 * rect.width, y: rect.maxY))
        path.close()
    }
    
    open static let style5: KemonoFriendsPathComposingClosure = { (path, rect) in
        path.move(to: CGPoint.init(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint.init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint.init(x: rect.minX, y: rect.maxY))
        path.close()
    }
}
