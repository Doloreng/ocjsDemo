//
//  TestJSobject.m
//  ocjsOne
//
//  Created by Eason on 16/6/15.
//  Copyright © 2016年 eason. All rights reserved.
//

#import "TestJSobject.h"

@implementation TestJSobject
-(void)noParameter{
    NSLog(@"这是js对象直接调用的方法");
}
-(void)oneParameter:(NSString*)message{
    NSLog(@"这是js对象直接调用的方法 message: %@",message);
}
-(void)twoParameter:(NSString*)message Second:(NSString*)secondMessage{
    NSLog(@"这是js对象直接调用的方法 message: %@, second: %@",message,secondMessage);
}
@end
