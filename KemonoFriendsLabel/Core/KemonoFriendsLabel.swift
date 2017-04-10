//
//  KemonoFriendsLabel.swift
//  KemonoFriendsLabel
//
//  Created by zzk on 2017/4/7.
//  Copyright © 2017年 zzk. All rights reserved.
//

import UIKit

@IBDesignable
open class KemonoFriendsLabel: UILabel {
    
    var pathCache = NSCache<NSNumber, KemonoFriendsPath>()
    
    open var preferredColors: [UIColor]? {
        didSet {
            if preferredColors != nil {
                assert(preferredColors!.count > 1, "must set more than one color in preferredColors array")
            }
        }
    }
    
    open var preferredPaths: [KemonoFriendsPath]?
    
    override open func drawText(in rect: CGRect) {
        super.drawText(in: rect)

        guard let context = UIGraphicsGetCurrentContext() else { return }
        guard let alphaImage = context.makeImage() else { return }
        
        context.clear(rect)
        
        // transform coordinate system
        let transform = CGAffineTransform.init(scaleX: 1, y: -1).translatedBy(x: 0, y: -rect.size.height)
        context.concatenate(transform)
        
        // set the mask image
        context.clip(to: rect, mask: alphaImage)
        
        // transform back
        context.concatenate(transform.inverted())
        
        // draw path
        for i in 0..<(text?.characters.count ?? 0) {
            let path = dequeuePath(at: i)
            path.fillColor?.set()
            path.fill()
            path.subtractedFillColor?.set()
            path.subtractedPath.fill()
        }
    }
    
    private func dequeuePath(at index: Int) -> KemonoFriendsPath {
        if let path = pathCache.object(forKey: NSNumber.init(value: index)) {
            path.recompose()
            return path
        } else {
            let path = createPath(in: boundingRectForCharacterRange(range: NSRange.init(location: index, length: 1)) ?? CGRect.zero)
            var color1: UIColor
            var color2: UIColor
            repeat {
                color1 = preferredColors?.random ?? UIColor.random
                color2 = preferredColors?.random ?? UIColor.random
            } while color2 == color1
            path.fillColor = color1
            path.subtractedFillColor = color2
            pathCache.setObject(path, forKey: NSNumber.init(value: index))
            return path
        }
    }
    
    private func createPath(in rect: CGRect) -> KemonoFriendsPath {
        return preferredPaths?.random ?? KemonoFriendsPath.init(rect: rect, style: .random)
    }
}

fileprivate extension UILabel {
//    func boundingRectForCharacterRange(range: NSRange) -> CGRect? {
//        
//        guard let attributedText = attributedText else { return nil }
//        
//        let textStorage = NSTextStorage(attributedString: attributedText)
//        let layoutManager = NSLayoutManager()
//        
//        textStorage.addLayoutManager(layoutManager)
//        
//        let textContainer = NSTextContainer(size: bounds.size)
//        textContainer.lineFragmentPadding = 0.0
//        
//        layoutManager.addTextContainer(textContainer)
//        
//        var glyphRange = NSRange()
//        
//        // Convert the range for glyphs.
//        layoutManager.characterRange(forGlyphRange: range, actualGlyphRange: &glyphRange)
//        
//        return layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
////        rect.origin.y += (bounds.height - systemLayoutSizeFitting(UILayoutFittingCompressedSize).height ) / 2
////        return rect
//    }
    func boundingRectForCharacterRange(range: NSRange) -> CGRect? {
        
        guard let attributedText = attributedText else { return nil }
        
        let textStorage = NSTextStorage(attributedString: attributedText)
        let layoutManager = NSLayoutManager()
        
        textStorage.addLayoutManager(layoutManager)
        
        let textContainer = NSTextContainer(size: bounds.size)
        textContainer.lineFragmentPadding = 0.0
        
        layoutManager.addTextContainer(textContainer)
        
        var glyphRange = NSRange()
        
        // Convert the range for glyphs.
        layoutManager.characterRange(forGlyphRange: range, actualGlyphRange: &glyphRange)
        
        return layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
    }
}

fileprivate extension UIColor {
    static var random: UIColor {
        var r, g, b: CGFloat
        repeat {
            r = CGFloat(arc4random_uniform(256))
            g = CGFloat(arc4random_uniform(256))
            b = CGFloat(arc4random_uniform(256))
        } while r * b * g > pow(240, 3)
        
        return UIColor.init(red: r / 255, green: g / 255, blue: b / 255, alpha: 1)
    }
}


fileprivate extension Array {
    var random: Element? {
        if count > 0 {
            let index = Int(arc4random_uniform(UInt32(count)))
            return self[index]
        } else {
            return nil
        }
    }
}

