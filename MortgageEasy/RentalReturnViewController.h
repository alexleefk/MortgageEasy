//
//  RentalReturnViewController.h
//  MortgageEasy
//
//  Created by Alex Lee on 20/12/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RentalReturnViewController : UIViewController

@property(weak,nonatomic) IBOutlet UITextField  *flatPriceTF, *rentalTF,
                                                *mgmtFeeTF, *otherFeeTF, *mortgageRepaymentTF, *investmentTF;
@property(weak, nonatomic) IBOutlet UILabel *bookReturnLabel, *bookReturnAfterTaxLabel,
                                            *realReturnLabel, *realReturnAfterTaxLabel;
@property(nonatomic) double taxRate, taxablePercent;

@end
