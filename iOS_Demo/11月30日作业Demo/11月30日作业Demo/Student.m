//
//  Student.m
//  11月30日作业Demo
//
//  Created by William on 2017/12/7.
//  Copyright © 2017年 William. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)setScore :(float)score{
    _score = score;
}
- (float)score{
    return _score;
}

-(instancetype)initWithName:(NSString *)name andAge:(int)age andNum:(NSString *)num andScore :(float)score{
    if(self = [super initWithName:name andAge:age andNum:num]){
        _score = score;
    }
    return self;
}

+(instancetype)student{
    return [[Student alloc] init];
}

+(instancetype)studentWithName:(NSString *)name andAge:(int)age andNum:(NSString *)num andScore :(float)score{
    return [[Student alloc] initWithName:name andAge:age andNum:num andScore:score];
}

-(NSString *)description{
    return [NSString stringWithFormat:@"name = %@,age = %i,num = %@,score = %f",_name,_age,_phoneNum,_score];
}

@end
