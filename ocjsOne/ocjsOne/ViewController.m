//
//  ViewController.m
//  ocjsOne
//
//  Created by Eason on 16/6/15.
//  Copyright © 2016年 eason. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "TestJSobject.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextView *outPutTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    self.outPutTextView.text=@"";
    [self loadObjectWebView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
//加载第二种
-(void)loadObjectWebView{
//    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"TestObject" ofType:@"html"];
//    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSURL *url =[NSURL URLWithString:@"http://ehealth.china.com:8887/info/TestObject.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    [self cutJsObjectTwo];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//第二种对象截取调用
-(void)cutJsObjectTwo{
    //js对象调用，创建对象
    JSContext *context = [self.webView    valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    TestJSobject *test = [TestJSobject new];
    context[@"TestJSobject"] = test;
}

#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    return YES;
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"web start load ");
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webViewDidFinishLoad  ");
    
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"didFailLoadWithError %@",error);
}
@end
