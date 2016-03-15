//
//  WebViewViewController.m
//  MySafari
//
//  Created by Michael Merrill on 3/15/16.
//  Copyright © 2016 Suleiman Younossi. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
