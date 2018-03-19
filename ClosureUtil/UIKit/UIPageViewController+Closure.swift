//
//  UIPageViewController+Closure.swift
//  ClosureUtil
//
//  Created by Shunsaku Miki on 2018/03/18.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

import UIKit

extension UIPageViewController {
    
    // MARK: - Delegate
    
    /// Closureを設定
    ///
    /// - Parameters:
    ///   - willTransitionToViewControllers:
    ///   - didFinishAnimating:
    ///   - spineLocationForInterfaceOrientation:
    ///   - preferredInterfaceOrientationForPresentation:
    func setCloureToDelegate(
        willTransitionToViewControllers: ((_ pageViewController: UIPageViewController, _ pendingViewControllers: [UIViewController]) -> ())? = nil,
        didFinishAnimating: ((_ pageViewController: UIPageViewController, _ finished: Bool, _ previousViewControllers: [UIViewController], _ completed: Bool) -> ())? = nil,
        spineLocationForInterfaceOrientation: ((_ pageViewController: UIPageViewController, _ orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation)? = nil,
        preferredInterfaceOrientationForPresentation: ((_ pageViewController: UIPageViewController) -> UIInterfaceOrientation)? = nil) {
        
        
        var blocks = [String: AnyObject]()
        
        if let cls = willTransitionToViewControllers {
            let _willTransitionToViewControllers = {(obj: BaseDelegateObject, pageViewController: UIPageViewController, pendingViewControllers: [UIViewController]) -> () in
                return cls(pageViewController, pendingViewControllers)
            }
            blocks["pageViewController:willTransitionToViewControllers:"] =
                unsafeBitCast(_willTransitionToViewControllers as @convention(block) (BaseDelegateObject, UIPageViewController, [UIViewController])->(Void), to: AnyObject.self)
        }
        
        if let cls = didFinishAnimating {
            let _didFinishAnimating = {(obj: BaseDelegateObject, pageViewController: UIPageViewController, finished: Bool, previousViewControllers: [UIViewController], completed: Bool) -> Void in
                return cls(pageViewController, finished, previousViewControllers, completed)
            }
            blocks["pageViewController:didFinishAnimating:previousViewControllers:transitionCompleted:"] =
                unsafeBitCast(_didFinishAnimating as @convention(block) (BaseDelegateObject, UIPageViewController, Bool, [UIViewController], Bool)->(Void), to: AnyObject.self)
        }
        
        if let cls = spineLocationForInterfaceOrientation {
            let _spineLocationForInterfaceOrientation = {(obj: BaseDelegateObject, pageViewController: UIPageViewController, orientation: UIInterfaceOrientation) -> (UIPageViewControllerSpineLocation) in
                return cls(pageViewController, orientation)
            }
            blocks["pageViewController:spineLocationForInterfaceOrientation:"] =
                unsafeBitCast(_spineLocationForInterfaceOrientation as @convention(block) (BaseDelegateObject, UIPageViewController, UIInterfaceOrientation)->(UIPageViewControllerSpineLocation), to: AnyObject.self)
        }
        
        if let cls = preferredInterfaceOrientationForPresentation {
            let _preferredInterfaceOrientationForPresentation = {(obj: BaseDelegateObject, pageViewController: UIPageViewController) -> (UIInterfaceOrientation) in
                return cls(pageViewController)
            }
            blocks["pageViewControllerPreferredInterfaceOrientationForPresentation:"] =
                unsafeBitCast(_preferredInterfaceOrientationForPresentation as @convention(block) (BaseDelegateObject, UIPageViewController)->(UIInterfaceOrientation), to: AnyObject.self)
        }
        
        self.setClosureToDelegate(blocks: blocks)
    }
    
    /// ClosureをDelegateに設定
    ///
    /// - Parameter blocks:
    func setClosureToDelegate(blocks: [String: AnyObject]) {
        self.delegate =
            BaseDelegateObject.generate(self, for: UIPageViewControllerDelegate.self, blocks: blocks) as? UIPageViewControllerDelegate
    }
    
    // MARK: - dataSource
    
    /// Closureを設定
    ///
    /// - Parameters:
    ///   - viewControllerBeforeViewController:
    ///   - viewControllerAfterViewController:
    ///   - presentationCountForPageViewController:
    ///   - presentationIndexForPageViewController:
    func setClosureToDataSource(
        viewControllerBeforeViewController: @escaping (_ pageViewController: UIPageViewController, _ viewController: UIViewController) -> (UIViewController)?,
        viewControllerAfterViewController: @escaping (_ pageViewController: UIPageViewController, _ viewController: UIViewController) -> (UIViewController)?,
        presentationCountForPageViewController: ((_ pageViewController: UIPageViewController) -> (Int))? = nil,
        presentationIndexForPageViewController: ((_ pageViewController: UIPageViewController) -> (Int))? = nil) {
        
        var blocks = [String: AnyObject]()
        
        let _viewControllerBeforeViewController = {(obj: BaseDelegateObject, pageViewController: UIPageViewController, viewController: UIViewController) -> (UIViewController)? in
            return viewControllerBeforeViewController(pageViewController, viewController)
        }
        blocks["pageViewController:viewControllerBeforeViewController:"] =
            unsafeBitCast(_viewControllerBeforeViewController as @convention(block) (BaseDelegateObject, UIPageViewController, UIViewController)->(UIViewController)?, to: AnyObject.self)
        
        let _viewControllerAfterViewController = {(obj: BaseDelegateObject, pageViewController: UIPageViewController, viewController: UIViewController) -> (UIViewController)? in
            return viewControllerAfterViewController(pageViewController, viewController)
        }
        blocks["pageViewController:viewControllerAfterViewController:"] =
            unsafeBitCast(_viewControllerAfterViewController as @convention(block) (BaseDelegateObject, UIPageViewController, UIViewController)->(UIViewController)?, to: AnyObject.self)
        
        if let cls = presentationCountForPageViewController {
            let _presentationCountForPageViewController = {(obj: BaseDelegateObject, pageViewController: UIPageViewController) -> (Int) in
                return cls(pageViewController)
            }
            blocks["presentationCountForPageViewController:"] =
                unsafeBitCast(_presentationCountForPageViewController as @convention(block) (BaseDelegateObject, UIPageViewController)->(Int), to: AnyObject.self)
        }
        
        if let cls = presentationIndexForPageViewController {
            let _presentationIndexForPageViewController = {(obj: BaseDelegateObject, pageViewController: UIPageViewController) -> (Int) in
                return cls(pageViewController)
            }
            blocks["presentationIndexForPageViewController:"] =
                unsafeBitCast(_presentationIndexForPageViewController as @convention(block) (BaseDelegateObject, UIPageViewController) -> (Int), to: AnyObject.self)
        }
        
        
        self.setClosureToDataSource(blocks: blocks)
    }
    
    /// ClosureをDelefateに設定
    ///
    /// - Parameter blocks:
    func setClosureToDataSource(blocks: [String: AnyObject]) {
        self.dataSource =
            BaseDelegateObject.generate(self, for: UIPageViewControllerDataSource.self, blocks: blocks) as? UIPageViewControllerDataSource
    }
    
}
