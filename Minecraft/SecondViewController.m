//
//  SecondViewController.m
//  Minecraft
//
//  Created by Tyler McMaster on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize umcdn;
@synthesize oov;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *nsud = [NSUserDefaults standardUserDefaults];
    
    [oov setOn:[nsud boolForKey:@"umcdn"]];
}

- (void)viewDidUnload
{
    [self setUmcdn:nil];
    [self setOov:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)sp:(id)sender {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    bool ucs = [umcdn isOn];
    //DEBUG Alert
    //UIAlertView *all = [[UIAlertView alloc] initWithTitle:@"Value" message:[NSString stringWithFormat:@"%@", ucs ? @"YES" : @"NO"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    //[all show];
    
    [ud setBool:ucs forKey:@"umcdn"];
    
    
    //Show a message telling the user the process is done
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"SAVED" message:@"Settings saved" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [al show];
}
@end
