//
//  GestureRecognizerUtils.swift
//  ClosureUtil
//
//  Created by Shunsaku Miki on 2018/03/20.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

import UIKit

final class GestureRecognizerUtil {

    /// 対象Viewに対して、ロングタップジェスチャーの登録と、そのジェスチャー時の挙動を設定
    ///
    /// - Parameters:
    ///   - view: 対象View
    ///   - target: 登録ジェスチャー時動作登録先インスタンス
    ///   - isGestureViewEqualTouchView: trueの場合Gesture対象とタッチされたViewが同じの時にコールバックが返る
    ///   - removeAddedGeture: 対象Viewに紐づくGestureを削除する場合true
    ///   - callback: 登録ジェスチャー時動作
    static func addLongPressGestureRecognizer(view: UIView, target: AnyObject, isGestureViewEqualTouchView: Bool = true, removeAddedGeture: Bool = true, callback: @escaping (UILongPressGestureRecognizer) -> ()) {
        let tmpCls = {(obj: AnyObject, gesture: UILongPressGestureRecognizer) -> Void in
            callback(gesture)
        }
        GestureRecognizerUtil.addGestureRecognizer(to: view, target: target, callback: unsafeBitCast(tmpCls as @convention(block) (AnyObject, UILongPressGestureRecognizer) -> Void, to: AnyObject.self),
                                  gesture: UILongPressGestureRecognizer(), isGestureViewEqualTouchView: isGestureViewEqualTouchView, removeAddedGeture: removeAddedGeture)
    }
    
    /// 対象Viewに対して、パンジェスチャーの登録と、そのジェスチャー時の挙動を設定
    ///
    /// - Parameters:
    ///   - view: 対象View
    ///   - target: 登録ジェスチャー時動作登録先インスタンス
    ///   - isGestureViewEqualTouchView: trueの場合Gesture対象とタッチされたViewが同じの時にコールバックが返る
    ///   - removeAddedGeture: 対象Viewに紐づくGestureを削除する場合true
    ///   - shouldRecognizeSimultaneouslyWithGestureRecognizer: 複数のジェスチャを認識するかのフラグ
    ///   - callback: 登録ジェスチャー時動作
    static func addPanGestureRecognizer(view: UIView, target: AnyObject, isGestureViewEqualTouchView: Bool = true, removeAddedGeture: Bool = true, shouldRecognizeSimultaneouslyWithGestureRecognizer: Bool = false, callback: @escaping (UIPanGestureRecognizer) -> ()) {
        let tmpCls = {(obj: AnyObject, gesture: UIPanGestureRecognizer) -> Void in
            callback(gesture)
        }
        GestureRecognizerUtil.addGestureRecognizer(to: view, target: target, callback: unsafeBitCast(tmpCls as @convention(block) (AnyObject, UIPanGestureRecognizer) -> Void, to: AnyObject.self),
                                                   gesture: UIPanGestureRecognizer(), isGestureViewEqualTouchView: isGestureViewEqualTouchView, removeAddedGeture: removeAddedGeture, shouldRecognizeSimultaneouslyWithGestureRecognizer: shouldRecognizeSimultaneouslyWithGestureRecognizer)
    }
    
    /// 対象Viewに対して、タップジェスチャーの登録と、そのジェスチャー時の挙動を設定
    ///
    /// - Parameters:
    ///   - view: 対象View
    ///   - target: 登録ジェスチャー時動作登録先インスタンス
    ///   - isGestureViewEqualTouchView: trueの場合Gesture対象とタッチされたViewが同じの時にコールバックが返る
    ///   - removeAddedGeture: 対象Viewに紐づくGestureを削除する場合true
    ///   - callback: 登録ジェスチャー時動作
    static func addTapGestureRecognizer(to view: UIView, target: AnyObject,
                                       isGestureViewEqualTouchView: Bool = true, removeAddedGeture: Bool = true, callback: @escaping (UITapGestureRecognizer) -> ()) {
        let tmpCls = {(obj: AnyObject, gesture: UITapGestureRecognizer) -> Void in
            callback(gesture)
        }
        self.addGestureRecognizer(to: view, target: target, callback: unsafeBitCast(tmpCls as @convention(block) (AnyObject, UITapGestureRecognizer) -> Void, to: AnyObject.self),
                                  gesture: UITapGestureRecognizer(), isGestureViewEqualTouchView: isGestureViewEqualTouchView, removeAddedGeture: removeAddedGeture)
    }
    
    /// 対象Viewに対して、ジェスチャーの登録と、そのジェスチャー時の挙動を設定
    ///
    /// - Parameters:
    ///   - view: 対象View
    ///   - target: 登録ジェスチャー時動作登録先インスタンス
    ///   - callback: 登録ジェスチャー時動作
    ///   - gesture: Gesture
    ///   - isGestureViewEqualTouchView: trueの場合Gesture対象とタッチされたViewが同じの時にコールバックが返る
    ///   - removeAddedGeture: 対象Viewに紐づくGestureを削除する場合true
    ///   - shouldRecognizeSimultaneouslyWithGestureRecognizer: 複数のジェスチャを認識するかのフラグ
    /// - Returns: 登録したGesutreのインスタンス
    @discardableResult
    static func addGestureRecognizer(to view: UIView, target: AnyObject, callback: AnyObject, gesture: UIGestureRecognizer, isGestureViewEqualTouchView: Bool = true, removeAddedGeture: Bool = true, shouldRecognizeSimultaneouslyWithGestureRecognizer: Bool = false) -> UIGestureRecognizer {
        if removeAddedGeture {
            removeAllGestureRecognizer(to: view)
        }
        gesture.addTarget(target, action: ClosureUtils.addBlockAndUniqueSelector(type(of: target), block: callback, argCnt: 1))
        gesture.cancelsTouchesInView = false
        gesture.setClosureToDelegate(shouldRecognizeSimultaneouslyWithGestureRecognizer: { (gestureRecognizer, otherGestureRecognizer) -> Bool in
            return shouldRecognizeSimultaneouslyWithGestureRecognizer
        }, shouldReceiveTouch: { (gestureRecognizer, touch) -> Bool in
            if isGestureViewEqualTouchView {
                if (gestureRecognizer.view == touch.view) {
                    return true
                } else {
                    return false
                }
            } else {
                return true
            }
        })
        
        // ジェスチャーを設定するViewの同時押しを禁止
        view.isExclusiveTouch = true
        view.addGestureRecognizer(gesture)
        
        return gesture
    }
    
    /// 登録されているGesutreを全て削除
    ///
    /// - Parameters:
    ///   - view: 削除対象View
    static func removeAllGestureRecognizer(to view: UIView) {
        if let gestureRecognizers = view.gestureRecognizers {
            gestureRecognizers.forEach({ view.removeGestureRecognizer($0) })
        }
    }
    
    /// 登録されているGestureから指定したGesutreTypeを削除
    ///
    /// - Parameters:
    ///   - view: 削除対象View
    ///   - removeGestureClass: 削除対象Gesture
    static func removeAllGestureRecognizer(to view: UIView, removeGestureClass: AnyClass) {
        
        if let gestureRecognizers = view.gestureRecognizers {
            gestureRecognizers.forEach({
                if $0.isKind(of: removeGestureClass) {
                    view.removeGestureRecognizer($0)
                }
            })
        }
    }
}
