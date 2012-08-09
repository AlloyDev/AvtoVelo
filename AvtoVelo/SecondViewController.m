//
//  SecondViewController.m
//  AvtoVelo
//
//  Created by Tsyganov Stanislav on 07.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize wv;
@synthesize backItemButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [wv loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://avtovelo.ru/index.php?option=com_tienda&view=products&filter_category=45&Itemid=123"]]];
}

- (void)viewDidUnload
{
    [self setWv:nil];
    [self setBackItemButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark myFucntions

-(void) changeHtmlPage{
    [wv stringByEvaluatingJavaScriptFromString:@"document.getElementById('leftCol').style.display = 'none';document.getElementsByClassName('outerWrapper')[0].style.display = 'none';document.getElementsByClassName('outerWrapper')[1].style.display = 'none';document.getElementsByClassName('outerWrapper')[2].style.display = 'none';document.getElementsByClassName('outerWrapper')[4].style.display = 'none';document.getElementsByClassName('outerWrapper')[5].style.display = 'none';document.getElementById('breadcrumb').style.display = 'none';document.getElementById('above').style.display = 'none';document.getElementsByClassName('innerContainer')[3].style.width = '100%';document.getElementsByClassName('innerContainer')[3].style.marginLeft = '0px';document.getElementsByClassName('shadow')[0].style.marginBottom = '0px';document.getElementsByClassName('container.center')[3].style.width = '100%';document.getElementById('midCol').style.width = '100%';" ];
    [self performSelector:@selector(pageReady) withObject:nil afterDelay:1];
}

-(void) pageReady{
    [wv setHidden:FALSE];
    if ([wv canGoBack]) {
        [backItemButton setEnabled:TRUE];
    }else {
        [backItemButton setEnabled:FALSE];
    }
}

#pragma mark WebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [wv setHidden:TRUE];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSLog(@"finish load");
    //[wv setHidden:FALSE];
    
    
    [self performSelector:@selector(changeHtmlPage)];
    
}


#pragma mark Actions
- (IBAction)backWebView:(id)sender {
    if ([wv canGoBack]) {
        [wv goBack];
    }
    
}
@end
