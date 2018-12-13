//
//  BaseDelegateObject.swift
//  HANABI
//
//  Created by Shunsaku Miki on 2018/12/11.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

import Foundation
import ObjectiveC

internal class BaseDelegateObject: NSObject {
    
    static func generate(delegateObject object: Any, proto: Protocol, blocks: [String: Any]) -> Any? {
        var proto = proto
        var _delegateObj = getAssociatedObject(object, key: &proto)
        
        if let _ = _delegateObj {
            addMethods(_delegateObj as! AnyClass, proto: proto, blocks: blocks)
            objc_removeAssociatedObjects(object)
            setAssociatedObject(object, key: &proto, value: _delegateObj)
        } else {
            if let subClass = try? registerClass() {
                class_addProtocol(subClass, proto)
                addMethods(subClass, proto: proto, blocks: blocks)
                _delegateObj = subClass.initialize()
                setAssociatedObject(object, key: &proto, value: blocks)
            }
        }
        return _delegateObj
    }
    
    /// メソッドの追加
    ///
    /// - Parameters:
    ///   - anyClass: 追加先クラス
    ///   - proto: DelegateのProtocol
    ///   - blocks: Delegateで呼ばれるblocksのDictionary
    internal static func addMethods(_ anyClass: AnyClass, proto: Protocol, blocks: [String: Any]) {
        blocks.keys.forEach { key in
            if let val = blocks[key] {
                let selector = NSSelectorFromString(key)
                var des = protocol_getMethodDescription(proto, selector, true, true)
                if des.name == nil {
                    des = protocol_getMethodDescription(proto, selector, false, true)
                }
                addMethod(anyClass: anyClass, selector: selector, types: des.types, block: val)
            }
        }
    }
    
    /// メソッドの追加
    ///
    /// - Parameters:
    ///   - anyClass: 追加先クラス
    ///   - selector: 追加メソッドSelector
    ///   - types: 追加メソッドtype
    ///   - block: 追加メソッドBlock
    internal static func addMethod(anyClass: AnyClass, selector: Selector, types: UnsafePointer<Int8>?, block: Any) {
        let oldImp = class_getMethodImplementation(anyClass, selector)
        if let oldImp = oldImp {
            imp_removeBlock(oldImp)
        }
        let imp = imp_implementationWithBlock(block)
        class_addMethod(anyClass, selector, imp, types)
    }
    
    
    /// 動的クラスの生成・登録
    ///
    /// - Returns: 生成・登録されたサブクラス
    /// - Throws: 生成失敗
    internal static func registerClass() throws -> AnyClass {
        let _subClassName = "\(UUID().uuidString)_DynamicDelegate"
        if let subClass = objc_allocateClassPair(self, _subClassName, 0)  {
            objc_registerClassPair(subClass)
            return subClass
        } else {
            throw NSError(domain: "generate failed", code: -1, userInfo: nil)
        }
    }
    
    /// プロパティの追加
    ///
    /// - Parameters:
    ///   - object: 追加先オブジェクト
    ///   - key: key
    ///   - value: value
    internal static func setAssociatedObject(_ object: Any, key: UnsafeRawPointer, value: Any?) {
        objc_setAssociatedObject(object, key, value, .OBJC_ASSOCIATION_RETAIN)
    }
    
    /// 追加オブジェクト取得
    ///
    /// - Parameters:
    ///   - object: 対象オブジェクト
    ///   - key: 追加オブジェクトキー
    /// - Returns: 対象のプロパティ
    internal static func getAssociatedObject(_ object: Any, key: UnsafeRawPointer) -> Any? {
        return objc_getAssociatedObject(object, key)
    }
    
    deinit {
        let _class = type(of: self)
        if _class != BaseDelegateObject.self {
            DispatchQueue.main.async {
                objc_disposeClassPair(_class)
            }
        }
        var count: UInt32 = 0
        let methodList = class_copyMethodList(type(of: self), &count)
        for i in 0..<count {
            if let method = methodList?[Int(i)] {
                let imp = method_getImplementation(method)
                imp_removeBlock(imp)
            }
        }
        free(methodList)
    }
}
