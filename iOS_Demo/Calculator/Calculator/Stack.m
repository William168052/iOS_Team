//
//  Stack.m
//  Calculator
//
//  Created by William on 2017/12/20.
//  Copyright © 2017年 William. All rights reserved.
//

#import "Stack.h"

@implementation Stack

//入栈
- (void)push :(id)data{
    [self.dataArray addObject:data];
}

//出栈
- (instancetype)pop{
    if(self.isEmpty){
        return NULL;
    }
    id ele = [self.dataArray lastObject];
    [self.dataArray removeLastObject];
    return ele;
}

//取栈顶元素
- (instancetype)getTopElement{
    if(self.isEmpty){
        return NULL;
    }
    return [self.dataArray lastObject];
}

- (BOOL)isEmpty{
    if(self.dataArray.count == 0)
        return YES;
    else
        return NO;
}

- (NSMutableArray *)dataArray{
    if(_dataArray == nil){
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}


@end
