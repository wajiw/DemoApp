//
//  DemoAppViewController.m
//  DemoApp
//
//  Created by Wa-jiw Casey on 7/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DemoAppViewController.h"

@implementation DemoAppViewController

@synthesize mySlider, myTextField, viewTwo; 

- (void)dealloc
{
    [mySlider release];  
    [myTextField release];  
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification object:nil];
    ViewTwo *v = [[ViewTwo alloc] initWithNibName:@"ViewTwo" bundle:nil];
    self.viewTwo = v;
    [v release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)orientationChanged:(NSNotification *)notification
{
    // We must add a delay here, otherwise we'll swap in the new view
	// too quickly and we'll get an animation glitch
    [self performSelector:@selector(updateLandscapeView) withObject:nil afterDelay:0];
}

- (void)updateLandscapeView
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if (UIDeviceOrientationIsLandscape(deviceOrientation) && !isShowingLandscapeView)
	{
        
        [self presentModalViewController:self.viewTwo animated:YES];
        isShowingLandscapeView = YES;
        //[myTextLabel setText:@"showing landscape"];
    }
	else if (deviceOrientation == UIDeviceOrientationPortrait && isShowingLandscapeView)
	{
        [self dismissModalViewControllerAnimated:YES];
        isShowingLandscapeView = NO;
        //[myTextLabel setText:@"showing portrait"];
    }    
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) changeText:(id)sender
{
    
    [myTextLabel setText:@"my string"];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your title" message:@"Your message" delegate:self cancelButtonTitle:@"Okay"  otherButtonTitles:nil];
//	[alert show];
//	[alert release];

    UIActionSheet *actionSheet = [[UIActionSheet alloc] 
                                  initWithTitle:@"Confirm to Exit?" 
                                  delegate:self 
                                  cancelButtonTitle:@"No!" 
                                  destructiveButtonTitle:@"Yes" 
                                  otherButtonTitles:nil]; 
    [actionSheet showInView:self.view]; 
    [actionSheet release]; 
}

- (void)actionSheet:(UIActionSheet *)actionSheet 
didDismissWithButtonIndex:(NSInteger)buttonIndex 
{ 
    if (buttonIndex == [actionSheet destructiveButtonIndex]) 
    { 
        exit(0);
    } 
} 

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex 
{
    if(buttonIndex == 0) //your OK button
    {
        //Some code here
    }
    else if(buttonIndex == 1)
    {
        //Some other code
    }
}

- (IBAction) sliderValueChanged:(UISlider *)sender {  
    myTextField.text = [NSString stringWithFormat:@"%.1f", [sender value]];  
} 

- (IBAction) changeButtonPressed:(id)sender {  
    NSString *textValue = [myTextField text];  
    float value = [textValue floatValue];  
    if (value < 0) value = 0;  
    if (value > 100) value = 100;  
    mySlider.value = value;  
    myTextField.text = [NSString stringWithFormat:@"%.1f", value];  
    if ([myTextField canResignFirstResponder]) [myTextField resignFirstResponder];  
}  

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {  
    if (myTextField) {  
        if ([myTextField canResignFirstResponder]) [myTextField resignFirstResponder];  
    }  
    [super touchesBegan: touches withEvent: event];  
} 

@end
