//
//  BaseDelegateObject.m
//  ClosureUtil
//
//  Created by Shunsaku Miki on 2018/03/18.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

#import "BaseDelegateObject.h"
#import <objc/runtime.h>

@implementation BaseDelegateObject

/**
 Delegateオブジェクトの生成
 
 @param object    Delegateオブジェクトを保持するインスタンス
 @param protocol  DelegateのProtocol
 @param blocksDic Delegateで呼ばれるblocksのDictionary
 
 @return 生成されたDelegateインスタンス
*/
+ (id)generateDelegateObject:(id)object forProtocol:(Protocol*)protocol blocks:(NSDictionary*)blocksDic
{
    id delegateObj = nil;
    
    delegateObj = [self getAssociatedObject:object forKey:(const void*)protocol];
    if (!delegateObj) {
        Class subClass = [self registSubclass];
        class_addProtocol(subClass, protocol);
        [self addMethods:subClass forProtocol:protocol blocks:blocksDic];
        delegateObj = [[subClass alloc] init];
        [self setAssociatedObject:object forKey:(const void*)protocol forVal:delegateObj];
    } else {
        [self addMethods:[delegateObj class] forProtocol:protocol blocks:blocksDic];
        //        delegateObj = [[[delegateObj class] alloc] init];
        //
        //        objc_removeAssociatedObjects(object);
        //        [self setAssociatedObject:object forKey:(const void*)protocol forVal:delegateObj];
    }
    
    return delegateObj;
}

/**
 メソッド追加
 
 @param class     追加先クラス
 @param protocol  DelegateのProtocol
 @param blocksDic Delegateで呼ばれるblocksのDictionary
 */
+ (void)addMethods:(Class) class forProtocol:(Protocol*)protocol blocks:(NSDictionary*)blocksDic
{
    struct objc_method_description method_description;
    for (id key in [blocksDic keyEnumerator]) {
        id val = [blocksDic valueForKey:key];
        
        if (val != nil) {
            SEL selector = NSSelectorFromString(key);
            method_description = protocol_getMethodDescription(protocol, selector, YES, YES);
            if (method_description.name == NULL) {
                method_description = protocol_getMethodDescription(protocol, selector, NO, YES);
            }
            [self addMethod:class sel:NSSelectorFromString(key) types:method_description.types block:val];
        }
    }
    
}

/**
 サブクラスの生成・登録
 
 @return 生成・登録されたサブクラス
 */


+ (Class)registSubclass
{
    NSString* subclassName = [NSString stringWithFormat:@"%@_%@", @"DynamicDelegate", [NSUUID UUID].UUIDString];
    Class subclass = objc_allocateClassPair(self, subclassName.UTF8String, 0);
    objc_registerClassPair(subclass);
    return subclass;
}

/**
 メソッドの追加
 
 @param class    追加先クラス
 @param selector 追加メソッドSELオブジェクト
 @param types    追加メソッドtype情報
 @param block    追加メソッドのblock
 */
+ (void)addMethod:(Class) class sel:(SEL)selector types:(const char*)types block:(id)block
{
    IMP oldImp = class_getMethodImplementation(class, selector);
    if (oldImp != NULL) {
        imp_removeBlock(oldImp);
    }
    
    IMP imp = imp_implementationWithBlock(block);
    class_addMethod(class, selector, imp, types);
}

/**
 オブジェクトに動的にプロパティを追加
 
 @param object 追加先オブジェクト
 @param key    Key
 @param val    Value
 */
+ (void)setAssociatedObject:(id)object forKey:(const void*)key forVal : (id)val
{
    objc_setAssociatedObject(object, key, val, OBJC_ASSOCIATION_RETAIN);
}

/**
 追加オブジェクト取得
 
 @param object 追加先オブジェクト
 @param key    追加オブジェクトキー
 
 @return 追加オブジェクト
 */
+ (id)getAssociatedObject:(id)object forKey:(const void*)key
{
    return objc_getAssociatedObject(object, key);
}

/**
 メモリ解放時処理
 */
- (void)dealloc
{
    Class class = self.class;
    if (class != [BaseDelegateObject class]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            objc_disposeClassPair(class);
        });
        
        unsigned int count = 0;
        Method* methodList = class_copyMethodList(self.class, &count);
        for (unsigned int i = 0; i < count; i++) {
            Method method = methodList[i];
            IMP imp = method_getImplementation(method);
            imp_removeBlock(imp);
        }
        free(methodList);
    }
}

@end

