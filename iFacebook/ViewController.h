//
//  ViewController.h
//  iFacebook
//
//  Created by administrator on 17/10/2014.
//  Copyright (c) 2014 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface ViewController : UIViewController
{
SLComposeViewController *mySLComposerSheet;
}

- (IBAction)btnPost:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *txtMessage;

@property (strong, nonatomic) IBOutlet UIImageView *imgFacebookLike;

@property (strong, nonatomic) IBOutlet UIButton *btnPost;
@end

