//
//  ViewController.m
//  HUWebViewController
//
//  Created by mac on 16/9/30.
//  Copyright © 2016年 hujewelz. All rights reserved.
//

#import "HUWebViewController.h"
#import "NJKWebViewProgressView.h"
#import "NJKWebViewProgress.h"

@interface HUWebViewController () <UIWebViewDelegate, NJKWebViewProgressDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) NJKWebViewProgressView *webViewProgressView;
@property (nonatomic, strong) NJKWebViewProgress *webViewProgress;


@end

@implementation HUWebViewController

- (instancetype)initWithURL:(NSURL *)url {
    if (self = [super init]) {
        _url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    _webViewProgress = [[NJKWebViewProgress alloc] init];
    self.webView.delegate = _webViewProgress;
    _webViewProgress.webViewProxyDelegate = self;
    _webViewProgress.progressDelegate = self;
    
    [self.navigationController.navigationBar addSubview:self.webViewProgressView];
    [self.view addSubview:self.webView];
    [self loadWebpage];
}

- (void)loadWebpage {
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:self.url];
    [self.webView loadRequest:req];
}

#pragma mark - NJKWebViewProgressDelegate

- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress {
 
    [self.webViewProgressView setProgress:progress animated:YES];
    self.title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

#pragma mark - getter

- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    }
    return _webView;
}

- (NJKWebViewProgress *)webViewProgress {
    if (!_webViewProgress) {
        _webViewProgress = [[NJKWebViewProgress alloc] init];
        self.webView.delegate = _webViewProgress;
        _webViewProgress.webViewProxyDelegate = self;
        _webViewProgress.progressDelegate = self;
    }
    return _webViewProgress;
}

- (NJKWebViewProgressView *)webViewProgressView {
    if (!_webViewProgressView) {
        CGRect navBounds = self.navigationController.navigationBar.bounds;
        CGRect barFrame = CGRectMake(0,
                                     navBounds.size.height - 2,
                                     navBounds.size.width,
                                     2);
        _webViewProgressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
        _webViewProgressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        [_webViewProgressView setProgress:0 animated:YES];
        
    }
    return _webViewProgressView;
}

@end
