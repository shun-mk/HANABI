//
//  ClosureUtil.swift
//  ClosureUtil
//
//  Created by Shunsaku Miki on 2018/03/18.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

import UIKit

final class ClosureUtils: NSObject {

    /// Blockをメソッドとしてクラスに追加
    ///
    /// - Parameters:
    ///   - addClass: 追加対象クラス
    ///   - sel: 追加するメソッドのSelector
    ///   - block: 追加するBlock
    class func addBlockMethod(addClass: AnyClass, sel: Selector, block: Any) {
        addBlockMethod(addClass, sel: sel, block: block, argCnt: -1)
    }
    
    /// Blockを用いてユニークな動的メソッドを生成
    ///
    /// - Parameters:
    ///   - addClass: 追加対象クラス
    ///   - block: 追加Block
    ///   - argCnt: 追加Blockの引数の数
    /// - Returns: 生成したユニークなメソッドのselector
    class func addBlockAndUniqueSelector(_ addClass: AnyClass, block: AnyObject, argCnt: Int) -> Selector {
        let selector: Selector = NSSelectorFromString(NSUUID().uuidString)
        addBlockMethod(addClass, sel: selector, block: block, argCnt: argCnt)
        return selector
    }
    
    /// Blockをメソッドとしてクラスに追加
    ///
    /// - Parameters:
    ///   - addClass: 追加対象クラス
    ///   - sel: 追加するメソッドのSelector
    ///   - block: 追加Block
    ///   - argCnt: 追加Blockの引数の数
    class func addBlockMethod(_ addClass: AnyClass, sel: Selector, block: Any, argCnt: Int) {
        
        let imp: IMP = imp_implementationWithBlock(block)
        
        let types: NSMutableString = NSMutableString()
        types.append("v@")
        
        if argCnt == -1 {
            types.append(":@")
        } else {
            for i in 0..<argCnt {
                if i == 0 {
                    types.append(":")
                }
                types.append("@")
            }
        }
        class_addMethod(addClass, sel, imp, types.utf8String)
    }
}
