//
//  FirstViewController.m
//  ocjsOne
//
//  Created by Eason on 16/6/15.
//  Copyright © 2016年 eason. All rights reserved.
//

#import "FirstViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface FirstViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *alab;
@property (strong, nonatomic) UILabel *blab;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.webView.delegate = self;
    [self loadHelloWebView];
    NSString *str=@"aaaaaaaaaaaaaaaa1aaaaaaaaaaaaaaaaaaaaa1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
//    _alab.text=str;
    NSMutableAttributedString *atrstr=[[NSMutableAttributedString alloc]initWithString:str];
    [atrstr addAttribute:NSFontAttributeName
                                   value:[UIFont systemFontOfSize:25]
                                   range:NSMakeRange(0, 10)];
    _alab.attributedText=atrstr;
    
    CGFloat x=self.view.frame.size.width/2-100;
    _blab = [[UILabel alloc]initWithFrame:CGRectMake(x, 160, 200, 80)];
//    [_alab setFrame:CGRectMake(x, 80, 200, 40)];
//    _blab.text=@"aaaaaaaaaaaaaaaa1aaaaaaaaaaaaaaaaaaaaa1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    _blab.textColor=[UIColor redColor];
    _blab.numberOfLines=0;
    _blab.attributedText=atrstr;
    [self.view addSubview:_blab];
    
    // Do any additional setup after loading the view.
}
//加载第一种
-(void)loadHelloWebView{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"Hello" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}
//第一种直接截取Js调用
-(void)cutJsOne{
    JSContext  *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    context[@"countOver"] = ^(id data){
        NSLog(@"在这里便可以捕获到函数名为countOver的操作，这个操作带个参数 %@ ",data);
        
    };
    context.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        //比如把js中的方法名改掉，OC找不到相应方法，这里就会打印异常信息
        NSLog(@"异常信息：%@", exceptionValue);
    };
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    return YES;
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self cutJsOne];
    
    
}
@end
