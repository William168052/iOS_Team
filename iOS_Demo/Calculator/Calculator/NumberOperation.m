//
//  NumberOperation.m
//  Calculator
//
//  Created by William on 2017/12/20.
//  Copyright © 2017年 William. All rights reserved.
//

#import "NumberOperation.h"
#import "Stack.h"

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

+ (NSNumber *)calculateWithValue_1 :(double)a andValue_2 :(double)b andOprator :(NSString *)opr{
    if([opr isEqualToString:@"+"]){
        return [self plusWithValue_1:a andValue_2:b];
    }else if([opr isEqualToString:@"-"]){
        return [self substractWithValue_1:a andValue_2:b];
    }else if([opr isEqualToString:@"×"]){
        return [self multiplyWithValue_1:a andValue_2:b];
    }else if([opr isEqualToString:@"÷"]){
        return [self divideWithValue_1:a andValue_2:b];
    }else if([opr isEqualToString:@"%"]){
        return [self remainderWithValue_1:a andValue_2:b];
    }else{
        return 0;
    }
}
//表达式求值
+ (NSNumber *)calculateWithExpression :(NSString *)exp{
    Stack<NSString *> *oprS = [[Stack alloc] init];
    Stack<NSString *> *numS = [[Stack alloc] init];
    double result;
    for(NSInteger i = 0;i<exp.length;i++){
        char c1 = [exp characterAtIndex:i];
        if(c1>='0'&&c1<='9'){
            NSString *s = @"";
            s = [NSString localizedStringWithFormat:@"%c",c1];
            for(NSInteger j = i+1;j<exp.length;j++){
                char c2 = [exp characterAtIndex:j];
                if((c2>='0'&&c2<='9') || c2 == '.'){
                    s = [NSString stringWithFormat:@"%@%c",s,c2];
                    i = j;
                }else{
                    break;
                }
            }
            //入栈
            [numS push:s];
        }else{
            if(oprS.isEmpty){
                [oprS push:[NSString stringWithFormat:@"%c",c1]];
            }else if([self compareOprWithInputOpr:[NSString stringWithFormat:@"%c",c1] andTopOpr:[oprS getTopElement]] == YES){
                //输入运算符优先级高于栈顶运算符入栈
                [oprS push:[NSString stringWithFormat:@"%c",c1]];
            }else if([self compareOprWithInputOpr:[NSString stringWithFormat:@"%c",c1] andTopOpr:[oprS getTopElement]] == NO){
                //输入运算符优先级不高于栈顶运算符取数据栈栈顶两个元素进行运算
                double val1 = [[numS pop] doubleValue];
                double val2 = [[numS pop] doubleValue];
                NSNumber *res = [self calculateWithValue_1:val2 andValue_2:val1 andOprator:[oprS pop]];
                [numS push:[res stringValue]];
                [oprS push:[NSString stringWithFormat:@"%c",c1]];
            }else{
                break;
            }
        }
        
    }
    while(oprS.isEmpty != YES){
        double val1 = [[numS pop] doubleValue];
        double val2 = [[numS pop] doubleValue];
        NSString *opr = [oprS pop];
        NSNumber *res = [self calculateWithValue_1:val2 andValue_2:val1 andOprator:opr];
        [numS push:[res stringValue]];
    }
    //oprStack栈为空则最后结果就是numStack的栈顶元素
    result = [numS pop].doubleValue;
    return [NSNumber numberWithDouble:result];
}

@end
