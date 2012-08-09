//
//  SecondViewController.h
//  AvtoVelo
//
//  Created by Tsyganov Stanislav on 07.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *wv;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItemButton;

- (IBAction)backWebView:(id)sender;

@end
