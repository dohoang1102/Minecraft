//
//  FirstViewController.m
//  Minecraft
//
//  Created by Tyler McMaster on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize username;
@synthesize password;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setUsername:nil];
    [self setPassword:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)dk:(id)sender {
    [username resignFirstResponder];
    [password resignFirstResponder];
    
}
- (IBAction)logintms:(id)sender {
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://session.minecraft.net/game/getversion.jsp?user=%@&password=%@&version=12",username.text,password.text]]];
    NSString *test = [[NSString alloc] initWithFormat:@"http://session.minecraft.net/game/getversion.jsp?user=%@&password=%@&version=12",username.text,password.text];
    NSData *response = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    
    NSString *mainstr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Response" message:mainstr delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [al show];
    
    UIAlertView *all = [[UIAlertView alloc] initWithTitle:@"URL" message:test delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [all show];
    
    
}
@end
