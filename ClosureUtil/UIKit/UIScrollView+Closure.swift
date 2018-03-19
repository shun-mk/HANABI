//
//  UIScrollView+Closure.swift
//  ClosureUtil
//
//  Created by Shunsaku Miki on 2018/03/18.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    ///  Closureを設定
    ///
    /// - Parameters:
    ///   - scrollViewDidScroll:
    ///   - scrollViewDidZoom:
    ///   - scrollViewWillBeginDragging:
    ///   - scrollViewWillEndDragging:
    ///   - scrollViewDidEndDragging:
    ///   - scrollViewWillBeginDecelerating:
    ///   - scrollViewDidEndDecelerating:
    ///   - scrollViewDidEndScrollingAnimation:
    ///   - viewForZoomingInScrollView:
    ///   - scrollViewWillBeginZooming:
    ///   - scrollViewDidEndZooming:
    ///   - scrollViewShouldScrollToTop:
    ///   - scrollViewDidScrollToTop:
    func setClosureToDelegate(
        scrollViewDidScroll: ((_ scrollView: UIScrollView) -> ())? = nil,
        scrollViewDidZoom: ((_ scrollView: UIScrollView) -> ())? = nil,
        scrollViewWillBeginDragging: ((_ scrollView: UIScrollView) -> ())? = nil,
        scrollViewWillEndDragging: ((_ scrollView: UIScrollView, _ velocity: CGPoint, _ targetContentOffset: UnsafeMutablePointer<CGPoint>) -> ())? = nil,
        scrollViewDidEndDragging: ((_ scrollView: UIScrollView, _ decelerate: Bool) -> ())? = nil,
        scrollViewWillBeginDecelerating: ((_ scrollView: UIScrollView) -> ())? = nil,
        scrollViewDidEndDecelerating: ((_ scrollView: UIScrollView) -> ())? = nil,
        scrollViewDidEndScrollingAnimation: ((_ scrollView: UIScrollView) -> ())? = nil,
        viewForZoomingInScrollView: ((_ scrollView: UIScrollView) -> UIView?)? = nil,
        scrollViewWillBeginZooming: ((_ scrollView: UIScrollView, _ view: UIView?) -> ())? = nil,
        scrollViewDidEndZooming: ((_ scrollView: UIScrollView, _ view: UIView?, _ scale: CGFloat) -> ())? = nil,
        scrollViewShouldScrollToTop: ((_ scrollView: UIScrollView) -> Bool)? = nil,
        scrollViewDidScrollToTop: ((_ scrollView: UIScrollView) -> ())? = nil
        ) {
        
        var blocks = [String: AnyObject]()
        
        if let cls = scrollViewDidScroll {
            let _scrollViewDidScroll = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidScroll:"] =
                unsafeBitCast(_scrollViewDidScroll as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewDidZoom {
            let _scrollViewDidZoom = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidZoom:"] =
                unsafeBitCast(_scrollViewDidZoom as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewWillBeginDragging {
            let _scrollViewWillBeginDragging = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewWillBeginDragging:"] =
                unsafeBitCast(_scrollViewWillBeginDragging as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewWillEndDragging {
            let _scrollViewWillEndDragging = {(obj: BaseDelegateObject, scrollView: UIScrollView, velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) -> () in
                return cls(scrollView, velocity, targetContentOffset)
            }
            blocks["scrollViewWillEndDragging:withVelocity:targetContentOffset:"] =
                unsafeBitCast(_scrollViewWillEndDragging as @convention(block) (BaseDelegateObject, UIScrollView, CGPoint, UnsafeMutablePointer<CGPoint>)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewDidEndDragging {
            let _scrollViewDidEndDragging = {(obj: BaseDelegateObject, scrollView: UIScrollView, decelerate: Bool) -> () in
                return cls(scrollView, decelerate)
            }
            blocks["scrollViewDidEndDragging:willDecelerate:"] =
                unsafeBitCast(_scrollViewDidEndDragging as @convention(block) (BaseDelegateObject, UIScrollView, Bool)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewWillBeginDecelerating {
            let _scrollViewWillBeginDecelerating = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewWillBeginDecelerating:"] =
                unsafeBitCast(_scrollViewWillBeginDecelerating as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewDidEndDecelerating {
            let _scrollViewDidEndDecelerating = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidEndDecelerating:"] =
                unsafeBitCast(_scrollViewDidEndDecelerating as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewDidEndScrollingAnimation {
            let _scrollViewDidEndScrollingAnimation = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidEndScrollingAnimation:"] =
                unsafeBitCast(_scrollViewDidEndScrollingAnimation as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = viewForZoomingInScrollView {
            let _viewForZoomingInScrollView = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> UIView? in
                return cls(scrollView)
            }
            blocks["viewForZoomingInScrollView:"] =
                unsafeBitCast(_viewForZoomingInScrollView as @convention(block) (BaseDelegateObject, UIScrollView)->UIView?, to: AnyObject.self)
        }
        
        if let cls = scrollViewWillBeginZooming {
            let _scrollViewWillBeginZooming = {(obj: BaseDelegateObject, scrollView: UIScrollView, view: UIView?) -> () in
                return cls(scrollView, view)
            }
            blocks["scrollViewWillBeginZooming:withView:"] =
                unsafeBitCast(_scrollViewWillBeginZooming as @convention(block) (BaseDelegateObject, UIScrollView, UIView?)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewDidEndZooming {
            let _scrollViewDidEndZooming = {(obj: BaseDelegateObject, scrollView: UIScrollView, view: UIView?, scale: CGFloat) -> () in
                return cls(scrollView, view, scale)
            }
            blocks["scrollViewDidEndZooming:withView:atScale:"] =
                unsafeBitCast(_scrollViewDidEndZooming as @convention(block) (BaseDelegateObject, UIScrollView, UIView?, CGFloat)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewShouldScrollToTop {
            let _scrollViewShouldScrollToTop = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> Bool in
                return cls(scrollView)
            }
            blocks["scrollViewShouldScrollToTop:"] =
                unsafeBitCast(_scrollViewShouldScrollToTop as @convention(block) (BaseDelegateObject, UIScrollView)->Bool, to: AnyObject.self)
        }
        
        if let cls = scrollViewDidScrollToTop {
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
    func setClosureToDelegate(scrollDelegate blocks: [String: AnyObject]) {
        self.delegate =
            BaseDelegateObject.generate(self, for: UIScrollViewDelegate.self, blocks: blocks) as? UIScrollViewDelegate
    }
}
