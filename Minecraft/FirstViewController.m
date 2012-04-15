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
@synthesize oov;
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
    [self setOov:nil];
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
    [oov setOn:false animated:YES];
}
- (IBAction)logintms:(id)sender {
    NSUserDefaults *nsud = [NSUserDefaults standardUserDefaults];
    //Removed Debug alert
    //UIAlertView *ui = [[UIAlertView alloc] initWithTitle:@"nsud" message:[NSString stringWithFormat:@"%@", [nsud boolForKey:@"umcdn"] ? @"YES" : @"NO"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    //[ui show];
    
    if ([nsud boolForKey:@"umcdn"] == TRUE) {
        
        NSString *test = [[NSString alloc] initWithFormat:@"https://login.minecraft.net/?user=%@&password=%@&version=12",username.text,password.text];
        NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:test]];
        NSData *response = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
        
        NSString *mainstr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Response" message:mainstr delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [al show];
        
        //UIAlertView *all = [[UIAlertView alloc] initWithTitle:@"URL" message:test delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        //[all show]; 
    } else {

        NSString *tst = [[NSString alloc] initWithFormat:@"http://mineshafter.appspot.com/game/getversion.jsp?proxy=34"];
        
        NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:tst]];
        [req setHTTPMethod:@"POST"];
        [req setHTTPBody:[[NSString stringWithFormat:@"user=%@&password=%@",username.text,password.text] dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSData *response = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
        
        NSString *mainstr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Response" message:mainstr delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [al show];
        
        //UIAlertView *all = [[UIAlertView alloc] initWithTitle:@"URL" message:tst delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        //[all show]; 
        
    }
    
    
}
@end
