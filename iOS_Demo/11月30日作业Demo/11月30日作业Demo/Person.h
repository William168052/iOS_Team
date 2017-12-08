//
//  Person.h
//  11月30日作业Demo
//
//  Created by William on 2017/12/7.
//  Copyright © 2017年 William. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
    int _age;
    NSString *_phoneNum;
}

- (void)setName :(NSString *)name;
- (NSString *)name;

- (void)setAge :(int)age;
- (int)age;

- (void)setPhoneNum :(NSString *)num;
- (NSString *)phoneNum;

//自定义构造方法
- (instancetype)initWithName :(NSString *)name andAge :(int)age andNum :(NSString *)num;

+ (instancetype)person;

+ (instancetype)personWithName :(NSString *)name andAge :(int)age andNum :(NSString *)num;
@end
