//
//  FirstViewController.m
//  MortgageEasy
//
//  Created by Alex Lee on 19/11/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import "FirstViewController.h"
#include <math.h>

@interface FirstViewController ()

@end



@implementation FirstViewController

@synthesize flatPrice, loanAmount, loanRate, loanRatio, loanYear, loanRatioTF, loanYearTF, monthlyRePaymentLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [loanRatioTF setText:[NSString stringWithFormat:@"%0f", loanRatio.value]];
    [loanYearTF setText:[NSString stringWithFormat:@"%0f", loanYear.value]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(double) calMonthlyRePayment:(double) P
                    rates:(double) r
                    tenor:(int) t
{
    /*
    r= [r decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"12"]];
    t= [t decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"12"]];
    */
    
    r=r/12/100;
    t=t*12;
    
    
    return (r*P*pow((1+r),t))/(pow((1+r),t)-1);
    
}

-(IBAction)Calculate:(id)sender{
    NSLog(@"Value of flatPrice is %@", flatPrice.text);
    NSLog(@"Value of loanAmount is %@", loanAmount.text);
    NSLog(@"Value of loanRate is %@", loanRate.text);
    NSLog(@"Value of loanRatio is %f", loanRatio.value);
    NSLog(@"Value of loanYear is %f", loanYear.value);
    
    double payment = [self calMonthlyRePayment:loanAmount.text.doubleValue rates:loanRate.text.doubleValue tenor:loanYear.value];
    NSLog(@"Value of monthly repayment is %2f", payment);
    
    [monthlyRePaymentLabel setText:[NSString stringWithFormat:@"%2f", payment]];
}

-(IBAction)updateLoadAmount:(id)sender{
    [loanAmount setText:[NSString stringWithFormat:@"%0f", loanRatio.value * flatPrice.text.intValue /100]];
}

-(IBAction)ValueChangeloanRatioSlider:(id)sender{
    [loanRatioTF setText:[NSString stringWithFormat:@"%0f", loanRatio.value]];
}

-(IBAction)ValueChangeloanYearSlider:(id)sender{
    [loanYearTF setText:[NSString stringWithFormat:@"%0f", loanYear.value]];
}


@end
