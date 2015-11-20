//
//  FirstViewController.h
//  MortgageEasy
//
//  Created by Alex Lee on 19/11/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property(strong,nonatomic) IBOutlet UITextField *flatPrice, *loanRate, *loanAmount;
@property(strong,nonatomic) IBOutlet UISlider *loanRatio, *loanYear;


@end

