//
//  Stack.h
//  Calculator
//
//  Created by William on 2017/12/20.
//  Copyright © 2017年 William. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack <__covariant T> : NSObject

@property (nonatomic,strong) NSMutableArray<T> *dataArray;
@property (nonatomic,assign) BOOL isEmpty;


//入栈
- (void)push :(T)data;

//出栈
- (T)pop;

//取栈顶元素
- (T)getTopElement;
@end
