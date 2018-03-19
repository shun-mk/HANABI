//
//  UITextField+Closure.swift
//  ClosureUtil
//
//  Created by Shunsaku Miki on 2018/03/18.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

import UIKit

//extension UITextField {
//    
//    /** */
//    typealias cls_textFieldShouldBeginEditing = (UITextField) -> Bool
//    /** */
//    typealias cls_textFieldDidBeginEditing = (UITextField) -> Void
//    /** */
//    typealias cls_textFieldShouldEndEditing = (UITextField) -> Bool
//    /** */
//    typealias cls_textFieldDidEndEditing = (UITextField) -> Void
//    /** */
//    typealias cls_shouldChangeCharactersInRange = (UITextField, NSRange, String) -> Bool
//    /** */
//    typealias cls_textFieldShouldClear = (UITextField) -> Bool
//    /** */
//    typealias cls_textFieldShouldReturn = (UITextField) -> Bool
//    
//    func setTextFieldShouldBeginEditing(cls: cls_textFieldShouldBeginEditing!) {
//        if (cls != nil) {
//            let tmpCls = {(obj: BaseDelegateObject, textField: UITextField) -> Bool in
//                return cls(textField);
//            };
//            
//            let blocks: Dictionary<String, AnyObject!> =
//                ["textFieldShouldBeginEditing:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextField)->(Bool), AnyObject.self)]
//            self.delegate =
//                BaseDelegateObject.genDelegateObject(self, forProtocol: UITextFieldDelegate.self, blocks: blocks) as? UITextFieldDelegate
//        }
//    }
//    
//    func setTextFieldDidBeginEditing(cls: cls_textFieldDidBeginEditing!) {
//        if (cls != nil) {
//            let tmpCls = {(obj: BaseDelegateObject, textField: UITextField) -> Void in
//                return cls(textField);
//            };
//            
//            let blocks: Dictionary<String, AnyObject!> =
//                ["textFieldDidBeginEditing:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextField)->(Void), AnyObject.self)]
//            self.delegate =
//                BaseDelegateObject.genDelegateObject(self, forProtocol: UITextFieldDelegate.self, blocks: blocks) as? UITextFieldDelegate
//        }
//    }
//    
//    func setTextFieldShouldEndEditing(cls: cls_textFieldShouldEndEditing!) {
//        if (cls != nil) {
//            let tmpCls = {(obj: BaseDelegateObject, textField: UITextField) -> Bool in
//                return cls(textField);
//            };
//            
//            let blocks: Dictionary<String, AnyObject!> =
//                ["textFieldShouldEndEditing:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextField)->(Bool), AnyObject.self)]
//            self.delegate =
//                BaseDelegateObject.genDelegateObject(self, forProtocol: UITextFieldDelegate.self, blocks: blocks) as? UITextFieldDelegate
//        }
//    }
//    
//    func setTextFieldDidEndEditing(cls: cls_textFieldDidEndEditing!) {
//        if (cls != nil) {
//            let tmpCls = {(obj: BaseDelegateObject, textField: UITextField) -> Void in
//                return cls(textField);
//            };
//            
//            let blocks: Dictionary<String, AnyObject!> =
//                ["textFieldDidEndEditing:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextField)->(Void), AnyObject.self)]
//            self.delegate =
//                BaseDelegateObject.genDelegateObject(self, forProtocol: UITextFieldDelegate.self, blocks: blocks) as? UITextFieldDelegate
//        }
//    }
//    
//    func setShouldChangeCharactersInRange(cls: cls_shouldChangeCharactersInRange!) {
//        if (cls != nil) {
//            let tmpCls = {(obj: BaseDelegateObject, textField: UITextField, range: NSRange, string: String) -> Bool in
//                return cls(textField, range, string);
//            };
//            
//            let blocks: Dictionary<String, AnyObject!> =
//                ["textField:shouldChangeCharactersInRange:replacementString:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextField, NSRange, String)->(Bool), AnyObject.self)]
//            self.delegate =
//                BaseDelegateObject.genDelegateObject(self, forProtocol: UITextFieldDelegate.self, blocks: blocks) as? UITextFieldDelegate
//        }
//    }
//    
//    func setTextFieldShouldClear(cls: cls_textFieldShouldClear!) {
//        if (cls != nil) {
//            let tmpCls = {(obj: BaseDelegateObject, textField: UITextField) -> Bool in
//                return cls(textField);
//            };
//            
//            let blocks: Dictionary<String, AnyObject!> =
//                ["textFieldShouldClear:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextField)->(Bool), AnyObject.self)]
//            self.delegate =
//                BaseDelegateObject.genDelegateObject(self, forProtocol: UITextFieldDelegate.self, blocks: blocks) as? UITextFieldDelegate
//        }
//    }
//    
//    func setTextFieldShouldReturn(cls: cls_textFieldShouldReturn!) {
//        if (cls != nil) {
//            let tmpCls = {(obj: BaseDelegateObject, textField: UITextField) -> Bool in
//                return cls(textField);
//            };
//            
//            let blocks: Dictionary<String, AnyObject!> =
//                ["textFieldShouldReturn:" : unsafeBitCast(tmpCls as @convention(block) (BaseDelegateObject, UITextField)->(Bool), AnyObject.self)]
//            self.delegate =
//                BaseDelegateObject.genDelegateObject(self, forProtocol: UITextFieldDelegate.self, blocks: blocks) as? UITextFieldDelegate
//        }
//    }
//    
//}

