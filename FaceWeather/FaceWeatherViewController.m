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
    [nowDate release];
    [TomorrowSwitch release];
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
    [nowDate setText:[NSString stringWithFormat:@"今日は%@", [NSDate date]]
     ];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [YokohamaButton release];
    YokohamaButton = nil;
    [nowDate release];
    nowDate = nil;
    [TomorrowSwitch release];
    TomorrowSwitch = nil;
    [TomorrowSwitch release];
    TomorrowSwitch = nil;
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
        [self getWeather:48];  
    [UIView beginAnimations:@"YokohamaButtonが移動するアニメーション" context:self.view]; 
    
    
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
    
    [self getWeather:63];
   

    
}


//- (void) getWeather:(int)wheatherPlaceNumber {
//    NSString * todayOrTomorrow = @"today";
//    
//    if([TomorrowSwitch isOn]) {
//        todayOrTomorrow = @"dayaftertomorrow";
//    }
//    
//    NSDictionary * placeDict = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt: wheatherPlaceNumber], @"placeNumber", 
//                                todayOrTomorrow, @"todayOrTomorrow",
//                                nil];
//    
//     [[NSNotificationCenter defaultCenter]postNotificationName:@"BUTTON_TAPPED" object:nil userInfo:placeDict];
//    
//}


- (void) getWeather:(int)weatherPlaceNumber {
    NSString * todayOrTomorrow = @"today";
     
       if([TomorrowSwitch isOn]) {
          todayOrTomorrow = @"dayaftertomorrow";
      }
      
      NSDictionary * placeDict = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt: weatherPlaceNumber], @"placeNumber", 
                                 todayOrTomorrow, @"todayOrTomorrow",
                                  nil];
 [[NSNotificationCenter defaultCenter]postNotificationName:@"BUTTON_TAPPED" object:nil userInfo:placeDict];
}


@end
