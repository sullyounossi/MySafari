//
//  WebViewViewController.m
//  MySafari
//
//  Created by Michael Merrill on 3/15/16.
//  Copyright © 2016 Suleiman Younossi. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController () < UIWebViewDelegate, UITextFieldDelegate >
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    [self loadWebPage:@"http://google.com"];
    self.urlTextField.delegate = self;
}

-(void)loadWebPage: (NSString *)webString {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:webString]];
    [self.webView loadRequest:request];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.urlTextField resignFirstResponder];
    
    [self loadWebPage:self.urlTextField.text];
    
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicator stopAnimating];
    
}

- (IBAction)onBackButtonPressed:(UIButton *)sender {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
}

- (IBAction)onForwardButtonPressed:(UIButton *)sender {
    if ([self.webView canGoForward]) {
        [self.webView goForward];
    }
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
