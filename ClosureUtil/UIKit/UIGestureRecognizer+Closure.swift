//
//  UIGestureRecognizer+Closure.swift
//  ClosureUtil
//
//  Created by Shunsaku Miki on 2018/03/18.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

import UIKit

extension UIGestureRecognizer {
    
    /// クロージャをdelegateに設定
    ///
    /// - Parameters:
    ///   - gestureRecognizerShouldBegin:
    ///   - shouldRecognizeSimultaneouslyWithGestureRecognizer:
    ///   - shouldRequireFailureOfGestureRecognizer:
    ///   - shouldBeRequiredToFailByGestureRecognizer:
    ///   - shouldReceiveTouch:
    func setClosureToDelegate(
        gestureRecognizerShouldBegin: ((_ gestureRecognizer: UIGestureRecognizer) -> Bool)? = nil,
        shouldRecognizeSimultaneouslyWithGestureRecognizer: ((_ gestureRecognizer: UIGestureRecognizer, _ otherGestureRecognizer: UIGestureRecognizer) -> Bool)? = nil,
        shouldRequireFailureOfGestureRecognizer: ((_ gestureRecognizer: UIGestureRecognizer,  _ otherGestureRecognizer: UIGestureRecognizer) -> Bool)? = nil,
        shouldBeRequiredToFailByGestureRecognizer: ((_ gestureRecognizer: UIGestureRecognizer, _ otherGestureRecognizer: UIGestureRecognizer) -> Bool)? = nil,
        shouldReceiveTouch: ((_ gestureRecognizer: UIGestureRecognizer, _ touch: UITouch) -> Bool)? = nil
        ) {
        
        var blocks = [String: AnyObject]()
        
        if let cls = gestureRecognizerShouldBegin {
            let _gestureRecognizerShouldBegin = {(obj: BaseDelegateObject, gestureRecognizer: UIGestureRecognizer) -> Bool in
                return cls(gestureRecognizer)
            }
            blocks["gestureRecognizerShouldBegin:"] =
                unsafeBitCast(_gestureRecognizerShouldBegin as @convention(block) (BaseDelegateObject, UIGestureRecognizer) -> Bool, to: AnyObject.self)
        }
        
        if let cls = shouldRecognizeSimultaneouslyWithGestureRecognizer {
            let _shouldRecognizeSimultaneouslyWithGestureRecognizer = {(obj: BaseDelegateObject, gestureRecognizer: UIGestureRecognizer, otherGestureRecognizer: UIGestureRecognizer) -> Bool in
                return cls(gestureRecognizer, otherGestureRecognizer)
            }
            blocks["gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:"] =
                unsafeBitCast(_shouldRecognizeSimultaneouslyWithGestureRecognizer as @convention(block) (BaseDelegateObject, UIGestureRecognizer, UIGestureRecognizer)->Bool, to: AnyObject.self)
        }
        
        if let cls = shouldRequireFailureOfGestureRecognizer {
            let _shouldRequireFailureOfGestureRecognizer = {(obj: BaseDelegateObject, gestureRecognizer: UIGestureRecognizer, otherGestureRecognizer: UIGestureRecognizer) -> Bool in
                return cls(gestureRecognizer, otherGestureRecognizer)
            }
            blocks["gestureRecognizer:shouldRequireFailureOfGestureRecognizer:"] =
                unsafeBitCast(_shouldRequireFailureOfGestureRecognizer as @convention(block) (BaseDelegateObject, UIGestureRecognizer, UIGestureRecognizer)->Bool, to: AnyObject.self)
        }
        
        if let cls = shouldBeRequiredToFailByGestureRecognizer {
            let _shouldBeRequiredToFailByGestureRecognizer = {(obj: BaseDelegateObject, gestureRecognizer: UIGestureRecognizer, otherGestureRecognizer: UIGestureRecognizer) -> Bool in
                return cls(gestureRecognizer, otherGestureRecognizer)
            }
            blocks["gestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:"] =
                unsafeBitCast(_shouldBeRequiredToFailByGestureRecognizer as @convention(block) (BaseDelegateObject, UIGestureRecognizer, UIGestureRecognizer)->Bool, to: AnyObject.self)
        }
        
        if let cls = shouldReceiveTouch {
            let _shouldReceiveTouch = {(obj: BaseDelegateObject, gestureRecognizer: UIGestureRecognizer, touch: UITouch) -> Bool in
                return cls(gestureRecognizer, touch)
            }
            blocks["gestureRecognizer:shouldReceiveTouch:"] =
                unsafeBitCast(_shouldReceiveTouch as @convention(block) (BaseDelegateObject, UIGestureRecognizer, UITouch)->Bool, to: AnyObject.self)
        }
        
        self.setClosureToDelegate(blocks: blocks)
    }
    
    /// ClosureをDelegateに設定
    ///
    /// - Parameter blocks:
    func setClosureToDelegate(blocks: [String: AnyObject]) {
        self.delegate =
            BaseDelegateObject.generate(self, for: UIGestureRecognizerDelegate.self, blocks: blocks) as? UIGestureRecognizerDelegate
    }
    
}
