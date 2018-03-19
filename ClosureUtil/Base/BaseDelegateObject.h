//
//  BaseDelegateObject.h
//  ClosureUtil
//
//  Created by Shunsaku Miki on 2018/03/18.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 基底Delegateオブジェクトクラス
 */
@interface BaseDelegateObject : NSObject

+ (id)generateDelegateObject:(id)object forProtocol:(Protocol*)protocol blocks:(NSDictionary*)blocksDic;

+ (id)getAssociatedObject:(id)object forKey:(const void*)key;

@end
