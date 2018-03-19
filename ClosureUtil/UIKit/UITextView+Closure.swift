//
//  UITextView+Closure.swift
//  ClosureUtil
//
//  Created by Shunsaku Miki on 2018/03/18.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

import UIKit

extension UITextView {
    
    /**
     textViewShouldBeginEditing:の設定
     
     :param: cls コールバッククロージャ
     */
    func setTextViewShouldBeginEditing(cls: @escaping (_ textView: UITextView) -> Bool) {
        let tmpCls = {(obj: BaseDelegateObject, textView: UITextView) -> Bool in
            return cls(textView)
        }
        
        self.setClosureToDelegate(blocks: ["textViewShouldBeginEditing:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextView)->(Bool), to: AnyObject.self)])
    }
    
    /**
     textViewShouldEndEditing:の設定
     
     :param: cls コールバッククロージャ
     */
    func setTextViewShouldEndEditing(cls: @escaping (_ textView: UITextView) -> Bool) {
        let tmpCls = {(obj: BaseDelegateObject, textView: UITextView) -> Bool in
            return cls(textView)
        }
        
        self.setClosureToDelegate(blocks: ["textViewShouldEndEditing:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextView)->(Bool), to: AnyObject.self)])
    }
    
    /**
     textViewDidBeginEditing:の設定
     
     :param: cls コールバッククロージャ
     */
    func setTextViewDidBeginEditing(cls: @escaping (_ textView: UITextView) -> Void) {
        let tmpCls = {(obj: BaseDelegateObject, textView: UITextView) -> Void in
            cls(textView)
        }
        
        self.setClosureToDelegate(blocks: ["textViewDidBeginEditing:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextView) -> (Void), to: AnyObject.self)])
    }
    
    /**
     textViewDidEndEditing:の設定
     
     :param: cls コールバッククロージャ
     */
    func setTextViewDidEndEditing(cls: @escaping (_ textView: UITextView) -> Void) {
        let tmpCls = {(obj: BaseDelegateObject, textView: UITextView) -> Void in
            cls(textView)
        }
        
        self.setClosureToDelegate(blocks: ["textViewDidEndEditing:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextView)->(Void), to: AnyObject.self)])
    }
    
    /**
     textView:shouldChangeTextInRange:replacementText:の設定
     
     :param: cls コールバッククロージャ
     */
    func setShouldChangeTextInRange(cls: @escaping (_ textView: UITextView, _ range: NSRange, _ text: String) -> Bool) {
        let tmpCls = {(obj: BaseDelegateObject, textView: UITextView, range: NSRange, text: String) -> Bool in
            return cls(textView, range, text)
        }
        
        self.setClosureToDelegate(blocks: ["textView:shouldChangeTextInRange:replacementText:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextView, NSRange, String)->(Bool), to: AnyObject.self)])
    }
    
    /**
     textViewDidChange:の設定
     
     :param: cls コールバッククロージャ
     */
    func setTextViewDidChange(cls: @escaping (_ textView: UITextView) -> Void) {
        let tmpCls = {(obj: BaseDelegateObject, textView: UITextView) -> Void in
            cls(textView)
        }
        
        self.setClosureToDelegate(blocks: ["textViewDidChange:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextView) -> (Void), to: AnyObject.self)])
    }
    
    /**
     textViewDidChangeSelection:の設定
     
     :param: cls コールバッククロージャ
     */
    func setTextViewDidChangeSelection(cls: @escaping (_ textView: UITextView) -> Void) {
        let tmpCls = {(obj: BaseDelegateObject, textView: UITextView) -> Void in
            cls(textView)
        }
        
        self.setClosureToDelegate(blocks: ["textViewDidChangeSelection:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextView)->(Void), to: AnyObject.self)])
    }
    
    /**
     textView:shouldInteractWithURL:inRange:の設定
     
     :param: cls コールバッククロージャ
     */
    func setShouldInteractWithURL(cls: @escaping (_ textView: UITextView, _ URL: NSURL, _ characterRange: NSRange) -> Bool) {
        let tmpCls = {(obj: BaseDelegateObject, textView: UITextView, URL: NSURL, characterRange: NSRange) -> Bool in
            return cls(textView, URL, characterRange)
        }
        
        self.setClosureToDelegate(blocks: ["textView:shouldInteractWithURL:inRange:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextView, NSURL, NSRange)->(Bool), to: AnyObject.self)])
    }
    
    /**
     textView:shouldInteractWithTextAttachment:inRange:の設定
     
     :param: cls コールバッククロージャ
     */
    func setShouldInteractWithTextAttachment(cls: @escaping (_ textView: UITextView, _ textAttachment: NSTextAttachment, _ characterRange: NSRange) -> Bool) {
        let tmpCls = {(obj: BaseDelegateObject, textView: UITextView, textAttachment: NSTextAttachment, characterRange: NSRange) -> Bool in
            return cls(textView, textAttachment, characterRange)
        }
        
        self.setClosureToDelegate(blocks: ["textView:shouldInteractWithTextAttachment:inRange:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextView, NSTextAttachment, NSRange)->(Bool), to: AnyObject.self)])
    }
    
    /**
     ClosureをDelegateに設定
     
     :param: blocks Closure
     */
    func setClosureToDelegate(blocks: [String: AnyObject]) {
        self.delegate =
            BaseDelegateObject.generate(self, for: UITextViewDelegate.self, blocks: blocks) as? UITextViewDelegate
    }
}
