//
//  FirstViewController.m
//  MortgageEasy
//
//  Created by Alex Lee on 19/11/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "PaymentDetailTableTableViewController.h"
#include <math.h>

@interface FirstViewController ()

@end



@implementation FirstViewController

@synthesize flatPrice, loanAmount, loanRate, loanRatio, loanYear, loanRatioTF, loanYearTF, monthlyRePaymentLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [loanRatioTF setText:[NSString stringWithFormat:@"%d", (int)loanRatio.value]];
    [loanYearTF setText:[NSString stringWithFormat:@"%d", (int)loanYear.value]];
    [loanAmount setText:[NSString stringWithFormat:@"%d",
                         (int)loanRatio.value * flatPrice.text.intValue /100]];
    
    [self Calculate:nil];
    //[self prepareForSegue:nil];
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
    
    int i, r;
    double interest, accurdInt, principle, tem_principle;
    NSNumber *intDes;
    
    NSLog(@"Value of flatPrice is %@", flatPrice.text);
    NSLog(@"Value of loanAmount is %@", loanAmount.text);
    NSLog(@"Value of loanRate is %@", loanRate.text);
    NSLog(@"Value of loanRatio is %f", loanRatio.value);
    NSLog(@"Value of loanYear is %f", loanYear.value);
    
    double payment = [self calMonthlyRePayment:loanAmount.text.doubleValue rates:loanRate.text.doubleValue tenor:loanYear.value];
    NSLog(@"Value of monthly repayment is %0.2f", payment);
    
    [monthlyRePaymentLabel setText:[NSString stringWithFormat:@"%0.2f", payment]];
    
    
    AppDelegate *ad = (AppDelegate *) [[UIApplication sharedApplication] delegate];
/*    [ad.prePaymentDetail addObject:@"aaa"];
    [ad.prePaymentDetail addObject:@"ccc"];
*/
    
    i = 0;
    r = 0;
    accurdInt = 0;
    principle = loanAmount.text.doubleValue;
    
    while (i<loanYear.value*12){
        tem_principle = principle - i * payment + accurdInt;
        interest = tem_principle * loanRate.text.doubleValue/12/100;
        intDes = [NSNumber numberWithDouble:interest];
        [ad.prePaymentDetail addObject:intDes];
        //NSLog(@"interest %d = %f", i, (float)interest);
        
        accurdInt = accurdInt + interest;
        
        i++;
    }
    
    NSLog(@"end of calculation");
    
}

-(IBAction)updateLoadAmount:(id)sender{
    [loanAmount setText:[NSString stringWithFormat:@"%d",
                         (int)loanRatio.value * flatPrice.text.intValue /100]];
    
    [flatPrice resignFirstResponder];
    [loanRatio resignFirstResponder];
}

-(IBAction)updateFlatPrice:(id)sender{
    [flatPrice setText:[NSString stringWithFormat:@"%d",
                         loanAmount.text.intValue/(int)loanRatio.value/100]];
    
    [loanAmount resignFirstResponder];
}

-(IBAction)ValueChangeloanRatioSlider:(id)sender{
    [loanRatioTF setText:[NSString stringWithFormat:@"%d", (int)loanRatio.value]];
}

-(IBAction)ValueChangeloanYearSlider:(id)sender{
    [loanYearTF setText:[NSString stringWithFormat:@"%d", (int)loanYear.value]];
}

-(IBAction)doneEditing:(id)sender{
    [sender resignFirstResponder];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showDetailSegue"]){
        PaymentDetailTableTableViewController *controller = (PaymentDetailTableTableViewController *)segue.destinationViewController;
        //controller.loanYear = (int)loanYear.value;
        
        
    }
}


@end
