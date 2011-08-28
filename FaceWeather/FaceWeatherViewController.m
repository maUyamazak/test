//
//  FaceWeatherViewController.m
//  FaceWeather
//
//  Created by Toru Inoue on 11/07/28.
//  Copyright 2011 KISSAKI. All rights reserved.
//

#import "FaceWeatherViewController.h"


@implementation FaceWeatherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [YokohamaButton release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [YokohamaButton release];
    YokohamaButton = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/**
 inoue
 */
- (IBAction)yokohamaTapped:(id)sender {
    NSDictionary * placeDict = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt:46], @"placeNumber",nil];
    
    [UIView beginAnimations:@"YokohamaButtonが移動するアニメーション" context:self.view]; 
    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"BUTTON_TAPPED" object:nil userInfo:placeDict];
     [YokohamaButton setFrame:CGRectMake(10,YokohamaButton.frame.origin.y, YokohamaButton.frame.size.width, YokohamaButton.frame.size.height)]; 
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:2.0];
    
    [UIView commitAnimations]; 
    
}

/**
 tan_go
 */
- (IBAction)tan_goTapped:(id)sender {
    //YokohamaButtonが押されたら、YokohamaButtonの位置を変えよう。
    
    NSDictionary * placeDict = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt:48], @"placeNumber",nil];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"BUTTON_TAPPED" object:nil userInfo:placeDict];
   
}

- (IBAction)TokyoTapped:(id)sender { 
    NSDictionary * placeDict = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt:63], @"placeNumber",nil];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"BUTTON_TAPPED" object:nil userInfo:placeDict];
}


@end
