//
//  ViewController.h
//  HUWebViewController
//
//  Created by mac on 16/9/30.
//  Copyright © 2016年 hujewelz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUWebViewController : UIViewController

- (instancetype)initWithURL:(NSURL *)url;

@property (nonatomic, strong) NSURL *url;


@end

