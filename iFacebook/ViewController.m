//
//  ViewController.m
//  iFacebook
//
//  Created by administrator on 17/10/2014.
//  Copyright (c) 2014 administrator. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize txtMessage, imgFacebookLike, btnPost;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.txtMessage.delegate = self;
    
    txtMessage.layer.cornerRadius = 15;
    txtMessage.layer.borderWidth = 0.5f;
    btnPost.layer.cornerRadius = 15;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPost:(id)sender
{
    if(![SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])  {
        NSLog(@"log output of your choice here");
    }
    // Facebook may not be available but the SLComposeViewController will handle the error for us.
    self->mySLComposerSheet = [[SLComposeViewController alloc] init];
    self->mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [self->mySLComposerSheet setInitialText:txtMessage.text];
    [self->mySLComposerSheet addImage:imgFacebookLike.image]; //an image you could post
    
    [self presentViewController:self->mySLComposerSheet animated:YES completion:nil];
    
    [self->mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
            default:
                break;
        }
        if (![output isEqualToString:@"Action Cancelled"]) {
            // Only alert if the post was a success. Or not! Up to you.
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        }
    }];

}
@end
