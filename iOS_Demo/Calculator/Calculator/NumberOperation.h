//
//  NumberOperation.h
//  Calculator
//
//  Created by William on 2017/12/20.
//  Copyright © 2017年 William. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberOperation : NSObject

+ (NSNumber *)plusWithValue_1 :(double)a andValue_2 :(double)b;
+ (NSNumber *)substractWithValue_1 :(double)a andValue_2 :(double)b;
+ (NSNumber *)multiplyWithValue_1 :(double)a andValue_2 :(double)b;
+ (NSNumber *)divideWithValue_1 :(double)a andValue_2 :(double)b;
+ (NSNumber *)remainderWithValue_1 :(double)a andValue_2 :(double)b;
//表达式求值
+ (NSNumber *)calculateWithExpression :(NSString *)exp;

@end
