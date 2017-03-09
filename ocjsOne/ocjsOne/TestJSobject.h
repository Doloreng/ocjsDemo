//
//  TestJSobject.h
//  ocjsOne
//
//  Created by Eason on 16/6/15.
//  Copyright © 2016年 eason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol TestJSobjectProtocol<JSExport>
-(void)noParameter;
-(void)oneParameter:(NSString*)message;
-(void)twoParameter:(NSString*)message Second:(NSString*)secondMessage;
@end

@interface TestJSobject : NSObject<TestJSobjectProtocol>

@end
