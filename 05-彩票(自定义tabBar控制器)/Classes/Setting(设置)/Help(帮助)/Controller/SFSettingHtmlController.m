//
//  SFSettingHtmlController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFSettingHtmlController.h"

@interface SFSettingHtmlController () <UIWebViewDelegate>

@end

@implementation SFSettingHtmlController


- (void)loadView {

    self.view = [[UIWebView alloc] initWithFrame:SFScreenBounds];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(dismiss)];
    
    UIWebView *webView = (UIWebView *)self.view;
    
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:_htmlItem.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    webView.delegate = self;
}

// webView加载完成的时候调用
// 执行javaScript, 必须要在webView加载完成的时候调用
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSString *javaStr = [NSString stringWithFormat:@"window.location.href = '#%@';", _htmlItem.ID];
    [webView stringByEvaluatingJavaScriptFromString:javaStr];
    
}

- (void)dismiss {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}




@end
