//
//  Student.h
//  11月30日作业Demo
//
//  Created by William on 2017/12/7.
//  Copyright © 2017年 William. All rights reserved.
//

#import "Person.h"

@interface Student : Person
{
    float _score;
}

- (void)setScore :(float)score;
- (float)score;

//自定义构造方法
-(instancetype)initWithName:(NSString *)name andAge:(int)age andNum:(NSString *)num andScore :(float)score;

+(instancetype)student;

+(instancetype)studentWithName:(NSString *)name andAge:(int)age andNum:(NSString *)num andScore :(float)score;
@end
