//
//  NumberOperation.m
//  Calculator
//
//  Created by William on 2017/12/20.
//  Copyright © 2017年 William. All rights reserved.
//

#import "NumberOperation.h"

@implementation NumberOperation

+ (NSNumber *)plusWithValue_1 :(double)a andValue_2 :(double)b{
    double result = a + b;
    NSNumber *number = [[NSNumber alloc] initWithDouble:result];
    return number;
}

+ (NSNumber *)substractWithValue_1 :(double)a andValue_2 :(double)b{
    double result = a - b;
    NSNumber *number = [[NSNumber alloc] initWithDouble:result];
    return number;
}

+ (NSNumber *)multiplyWithValue_1 :(double)a andValue_2 :(double)b{
    double result = a * b;
    NSNumber *number = [[NSNumber alloc] initWithDouble:result];
    return number;
}

+ (NSNumber *)divideWithValue_1 :(double)a andValue_2 :(double)b{
    double result;
    @try {
        result = a / b;
    }
    @catch (NSException *exception) {
        NSLog(@"Exception named %@ accured , reason is : %@",exception.name,exception.reason);
        result = 0.0;
    }
    return [NSNumber numberWithDouble:result];
}

+ (NSNumber *)remainderWithValue_1 :(double)a andValue_2 :(double)b{
    NSNumber *num1 = [NSNumber numberWithDouble:a];
    NSNumber *num2 = [NSNumber numberWithDouble:b];
    NSInteger result;
    @try {
        result = num1.integerValue % num2.integerValue;
    }
    @catch (NSException *exception) {
        NSLog(@"Exception named %@ accured , reason is : %@",exception.name,exception.reason);
        result = 0;
    }
    return [NSNumber numberWithInteger:result];
}

+ (BOOL)compareOprWithInputOpr :(NSString *)input_opr andTopOpr :(NSString *)top_opr{
    // 如果当前栈顶的操作运算符为“+”或“-”，并且输入运算符为“*”或“/”时，输入的运算符优先级大
    if (([input_opr isEqualToString:@"×"] ||
         [input_opr isEqualToString:@"÷"] ||
         [input_opr isEqualToString:@"%"])&&
        ([top_opr isEqualToString:@"+"] ||
         [top_opr isEqualToString:@"-"])) {
        return YES;
    }
    return NO;
}


@end
