//
//  DemoAppViewController.h
//  DemoApp
//
//  Created by Wa-jiw Casey on 7/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewTwo.h"

@interface DemoAppViewController : UIViewController <UIActionSheetDelegate>{
    IBOutlet UILabel *myTextLabel;
	BOOL isShowingLandscapeView;
    
    IBOutlet UISlider *mySlider;
    IBOutlet UITextField *myTextField;
	ViewTwo *viewTwo;
}

@property (nonatomic, retain) IBOutlet UISlider *mySlider;  
@property (nonatomic, retain) IBOutlet UITextField *myTextField; 

@property (nonatomic, retain) ViewTwo *viewTwo;

- (IBAction) sliderValueChanged:(id)sender;  
- (IBAction) changeButtonPressed:(id)sender;  

- (IBAction) changeText:(id)sender;
@end
