//
//  PurchasingPowerCal.h
//  MortgageEasy
//
//  Created by Alex Lee on 19/11/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PurchasingPowerCal : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *salaryTF, *repaymentTF, *mortgageTF, *rateTF, *yearTF;
@property (weak, nonatomic) IBOutlet UISwitch *firstPropSwitch;
@property (weak, nonatomic) IBOutlet UILabel * maxLoanLabel;


@end

