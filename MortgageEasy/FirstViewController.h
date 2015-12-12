//
//  FirstViewController.h
//  MortgageEasy
//
//  Created by Alex Lee on 19/11/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property(strong,nonatomic) IBOutlet UITextField    *flatPriceTF, *loanAmountTF,
                                                    *loanRatioTF, *loanYearTF, *loanRateTF;
@property(strong,nonatomic) IBOutlet UISlider  *flatPriceSB, *loanAmountSB,
                                                *loanRatioSB, *loanYearSB, *loanRateSB;
@property(strong, nonatomic) IBOutlet UILabel *monthlyRePaymentLabel;
@property(strong,nonatomic) IBOutlet UIScrollView *scrollv;


@end

