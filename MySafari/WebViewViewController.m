//
//  WebViewViewController.m
//  MySafari
//
//  Created by Michael Merrill on 3/15/16.
//  Copyright © 2016 Suleiman Younossi. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController () < UIWebViewDelegate, UITextFieldDelegate, UIScrollViewDelegate >
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property BOOL isScrolling;

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    self.urlTextField.delegate = self;
    self.webView.scrollView.delegate = self;
    
    [self loadWebPage:@"http://google.com"];
}

-(void)loadWebPage: (NSString *)webString {
    NSURL *url = [self checkForProtocal:webString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (NSURL *)checkForProtocal:(NSString *)webString {
    NSURL *url;
    if ([webString.lowercaseString hasPrefix:@"http://"]) {
        url = [NSURL URLWithString:webString];
    } else {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", webString]];
    }
    
    return url;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [self.urlTextField resignFirstResponder];
    
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

- (IBAction)onStopLoadingButtonPressed:(UIButton *)sender {
    if ([self.webView isLoading]) {
        [self.webView stopLoading];
    }
}


- (IBAction)onReloadButtonPressed:(UIButton *)sender {
    [self.webView reload];
}

- (IBAction)comingSoonButtonPressed:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Coming Soon" message:@"You'll never guess what we have in store for you" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *closeButton = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:closeButton];
    
    [self presentViewController:alertController animated:YES completion:nil];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self setUrlTextFieldHidden:YES];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self setUrlTextFieldHidden:FALSE];
}


- (void)setUrlTextFieldHidden:(BOOL)hidden {
    if (hidden == YES) {
        self.urlTextField.hidden = TRUE;
    } else {
        self.urlTextField.hidden = FALSE;
    }
}


@end
