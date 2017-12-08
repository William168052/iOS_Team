//
//  Person.m
//  11月30日作业Demo
//
//  Created by William on 2017/12/7.
//  Copyright © 2017年 William. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)setName :(NSString *)name{
    _name = name;
}
- (NSString *)name{
    return _name;
}

- (void)setAge :(int)age{
    _age = age;
}
- (int)age{
    return _age;
}

- (void)setPhoneNum :(NSString *)num{
    _phoneNum = num;
}
- (NSString *)phoneNum{
    return _phoneNum;
}


- (instancetype)init{
    if(self = [super init]){
        _age = 18;
    }
    return self;
}

- (instancetype)initWithName :(NSString *)name andAge :(int)age andNum :(NSString *)num{
    if(self = [super init]){
        _name = name;
        _age = age;
        _phoneNum = num;
    }
    return self;
}

+ (instancetype)person{
    return [[Person alloc] init];
}

+ (instancetype)personWithName :(NSString *)name andAge :(int)age andNum :(NSString *)num{
    return [[Person alloc]initWithName:name andAge:age andNum:num];
}


//description

-(NSString *)description{
    return [NSString stringWithFormat:@"name = %@,age = %i,num = %@",_name,_age,_phoneNum];
}
@end
