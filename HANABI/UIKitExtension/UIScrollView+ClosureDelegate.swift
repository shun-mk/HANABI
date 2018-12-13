//
//  UIScrollView+ClosureDelegate.swift
//  HANABI
//
//  Created by Shunsaku Miki on 2018/12/13.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

import UIKit

public extension UIScrollView {
    
    func setClosureToScrollViewDelegate(
        didScroll: ((_ scrollView: UIScrollView) -> ())? = nil,
        didZoom: ((_ scrollView: UIScrollView) -> ())? = nil,
        willBeginDragging: ((_ scrollView: UIScrollView) -> ())? = nil,
        willEndDragging: ((_ scrollView: UIScrollView, _ velocity: CGPoint, _ targetContentOffset: UnsafeMutablePointer<CGPoint>) -> ())? = nil,
        didEndDragging: ((_ scrollView: UIScrollView, _ decelerate: Bool) -> ())? = nil,
        willBeginDecelerating: ((_ scrollView: UIScrollView) -> ())? = nil,
        didEndDecelerating: ((_ scrollView: UIScrollView) -> ())? = nil,
        didEndScrollingAnimation: ((_ scrollView: UIScrollView) -> ())? = nil,
        viewForZoomingIn: ((_ scrollView: UIScrollView) -> UIView?)? = nil,
        willBeginZooming: ((_ scrollView: UIScrollView, _ view: UIView?) -> ())? = nil,
        didEndZooming: ((_ scrollView: UIScrollView, _ view: UIView?, _ scale: CGFloat) -> ())? = nil,
        shouldScrollToTop: ((_ scrollView: UIScrollView) -> Bool)? = nil,
        didScrollToTop: ((_ scrollView: UIScrollView) -> ())? = nil
        ) {
        
        var blocks = [String: AnyObject]()
        
        if let cls = didScroll {
            let _scrollViewDidScroll = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidScroll:"] =
                unsafeBitCast(_scrollViewDidScroll as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = didZoom {
            let _scrollViewDidZoom = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidZoom:"] =
                unsafeBitCast(_scrollViewDidZoom as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = willBeginDragging {
            let _scrollViewWillBeginDragging = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewWillBeginDragging:"] =
                unsafeBitCast(_scrollViewWillBeginDragging as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = willEndDragging {
            let _scrollViewWillEndDragging = {(obj: BaseDelegateObject, scrollView: UIScrollView, velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) -> () in
                return cls(scrollView, velocity, targetContentOffset)
            }
            blocks["scrollViewWillEndDragging:withVelocity:targetContentOffset:"] =
                unsafeBitCast(_scrollViewWillEndDragging as @convention(block) (BaseDelegateObject, UIScrollView, CGPoint, UnsafeMutablePointer<CGPoint>)->(), to: AnyObject.self)
        }
        
        if let cls = didEndDragging {
            let _scrollViewDidEndDragging = {(obj: BaseDelegateObject, scrollView: UIScrollView, decelerate: Bool) -> () in
                return cls(scrollView, decelerate)
            }
            blocks["scrollViewDidEndDragging:willDecelerate:"] =
                unsafeBitCast(_scrollViewDidEndDragging as @convention(block) (BaseDelegateObject, UIScrollView, Bool)->(), to: AnyObject.self)
        }
        
        if let cls = willBeginDecelerating {
            let _scrollViewWillBeginDecelerating = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewWillBeginDecelerating:"] =
                unsafeBitCast(_scrollViewWillBeginDecelerating as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = didEndDecelerating {
            let _scrollViewDidEndDecelerating = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidEndDecelerating:"] =
                unsafeBitCast(_scrollViewDidEndDecelerating as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = didEndScrollingAnimation {
            let _scrollViewDidEndScrollingAnimation = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidEndScrollingAnimation:"] =
                unsafeBitCast(_scrollViewDidEndScrollingAnimation as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = viewForZoomingIn {
            let _viewForZoomingInScrollView = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> UIView? in
                return cls(scrollView)
            }
            blocks["viewForZoomingInScrollView:"] =
                unsafeBitCast(_viewForZoomingInScrollView as @convention(block) (BaseDelegateObject, UIScrollView)->UIView?, to: AnyObject.self)
        }
        
        if let cls = willBeginZooming {
            let _scrollViewWillBeginZooming = {(obj: BaseDelegateObject, scrollView: UIScrollView, view: UIView?) -> () in
                return cls(scrollView, view)
            }
            blocks["scrollViewWillBeginZooming:withView:"] =
                unsafeBitCast(_scrollViewWillBeginZooming as @convention(block) (BaseDelegateObject, UIScrollView, UIView?)->(), to: AnyObject.self)
        }
        
        if let cls = didEndZooming {
            let _scrollViewDidEndZooming = {(obj: BaseDelegateObject, scrollView: UIScrollView, view: UIView?, scale: CGFloat) -> () in
                return cls(scrollView, view, scale)
            }
            blocks["scrollViewDidEndZooming:withView:atScale:"] =
                unsafeBitCast(_scrollViewDidEndZooming as @convention(block) (BaseDelegateObject, UIScrollView, UIView?, CGFloat)->(), to: AnyObject.self)
        }
        
        if let cls = shouldScrollToTop {
            let _scrollViewShouldScrollToTop = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> Bool in
                return cls(scrollView)
            }
            blocks["scrollViewShouldScrollToTop:"] =
                unsafeBitCast(_scrollViewShouldScrollToTop as @convention(block) (BaseDelegateObject, UIScrollView)->Bool, to: AnyObject.self)
        }
        
        if let cls = didScrollToTop {
            let _scrollViewDidScrollToTop = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidScrollToTop:"] =
                unsafeBitCast(_scrollViewDidScrollToTop as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        self.setClosureToDelegate(scrollDelegate: blocks)
    }
    
    /// ClosureをDelegateに設定
    ///
    /// - Parameter blocks:
    private func setClosureToDelegate(scrollDelegate blocks: [String: AnyObject]) {
        self.delegate = BaseDelegateObject.generate(delegateObject: self, proto: UIScrollViewDelegate.self, blocks: blocks) as? UIScrollViewDelegate
    }
}
