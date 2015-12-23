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

@synthesize flatPriceTF, loanAmountTF, loanRateTF, loanRatioTF, loanYearTF,
            flatPriceSB, loanAmountSB, loanRateSB, loanRatioSB, loanYearSB,
            monthlyRePaymentLabel, scrollv;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self.loanRatioTF setText:[NSString stringWithFormat:@"%d", (int)loanRatioTF.text.intValue]];
    //[self.loanYearTF setText:[NSString stringWithFormat:@"%d", (int)loanYearTF.text.intValue]];
    [self.loanAmountTF setText:[NSString stringWithFormat:@"%d",
                         (int)loanRatioTF.text.intValue * flatPriceTF.text.intValue /100]];
    
    self.monthlyRePaymentLabel.numberOfLines = 0;
    //[self.monthlyRePaymentLabel sizeToFit ];
    
    //[loanRatioTF setKeyboardType:UIKeyboardTypeDecimalPad];
    //[loanRateTF setKeyboardType:UIKeyboardTypeDecimalPad];
    
    [self Calculate:nil];
    //[self prepareForSegue:nil];
    
    self.scrollv.contentSize = CGSizeMake(self.view.frame.size.width,
                                          self.monthlyRePaymentLabel.frame.origin.y + self.monthlyRePaymentLabel.frame.size.height +30);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(double) calMonthlyRePayment:(double) P
                    rates:(double) r
                    tenor:(int) t
{
    
    r=r/12/100;
    t=t*12;
    
    
    return (r*P*pow((1+r),t))/(pow((1+r),t)-1);
    
}

-(IBAction)Calculate:(id)sender{
    
    int i, r;
    double interest, accurdInt, principle, tem_principle;
    NSNumber *intDes;
    
    NSLog(@"Value of flatPriceTF is %@", flatPriceTF.text);
    NSLog(@"Value of loanAmountTF is %@", loanAmountTF.text);
    NSLog(@"Value of loanRateTF is %@", loanRateTF.text);
    NSLog(@"Value of loanRatio is %0.2f", loanRatioTF.text.doubleValue);
    NSLog(@"Value of loanYear is %d", loanYearTF.text.intValue);
    
    double payment = [self calMonthlyRePayment:loanAmountTF.text.doubleValue rates:loanRateTF.text.doubleValue tenor:loanYearTF.text.intValue];
    NSLog(@"Value of monthly repayment is %0.2f", payment);
    
    [monthlyRePaymentLabel setText:[NSString stringWithFormat:@"%0.2f", payment]];
    
    
    AppDelegate *ad = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    [ad.prePaymentDetail removeAllObjects];
    
    i = 0;
    r = 0;
    accurdInt = 0;
    principle = loanAmountTF.text.doubleValue;
    
    while (i<loanYearTF.text.intValue*12){
        tem_principle = principle - i * payment + accurdInt;
        interest = tem_principle * loanRateTF.text.doubleValue/12/100;
        intDes = [NSNumber numberWithDouble:interest];
        [ad.prePaymentDetail addObject:intDes];
        //NSLog(@"interest %d = %f", i, (float)interest);
        
        accurdInt = accurdInt + interest;
        
        i++;
    }
    
    NSLog(@"First page size = %d", (int)ad.prePaymentDetail.count);
    NSLog(@"end of calculation");
    
}

-(IBAction)updateLoadAmountTF:(id)sender{
    [loanAmountTF setText:[NSString stringWithFormat:@"%d",
                         (int)loanRatioTF.text.intValue * flatPriceTF.text.intValue /100]];
    
    [flatPriceTF resignFirstResponder];
    [loanRatioTF resignFirstResponder];
}

-(IBAction)updateflatPriceTF:(id)sender{
    [flatPriceTF setText:[NSString stringWithFormat:@"%d",
                         loanAmountTF.text.intValue/(int)loanRatioTF.text.intValue/100]];
    
    [loanAmountTF resignFirstResponder];
}

-(IBAction)ValueChangeloanRatioSlider:(id)sender{
    [loanRatioTF setText:[NSString stringWithFormat:@"%d", (int)loanRatioSB.value]];
    
    self.loanAmountSB.value = (int) (loanRatioSB.value/100 * flatPriceSB.value);
    [self.loanAmountTF setText:[NSString stringWithFormat:@"%d", (int)loanAmountSB.value]];
}

-(IBAction)ValueChangeloanYearSlider:(id)sender{
    [loanYearTF setText:[NSString stringWithFormat:@"%d", (int)loanYearSB.value]];
}

-(IBAction)ValueChangeflatPriceSlider:(id)sender{
    [flatPriceTF setText:[NSString stringWithFormat:@"%d", (int)flatPriceSB.value]];
    
    self.loanAmountSB.value = (int) (loanRatioSB.value/100 * flatPriceSB.value);
    [self.loanAmountTF setText:[NSString stringWithFormat:@"%d", (int)loanAmountSB.value]];
}

-(IBAction)ValueChangeloanRateSlider:(id)sender{
    [loanRateTF setText:[NSString stringWithFormat:@"%0.2f", (double)loanRateSB.value]];
}

-(IBAction)ValueChangeloanAmountSlider:(id)sender{
    [loanAmountTF setText:[NSString stringWithFormat:@"%d", (int)loanAmountSB.value]];
    
    self.flatPriceSB.value = (int) (loanAmountSB.value / (loanRatioSB.value/100) );
    [self.flatPriceTF setText:[NSString stringWithFormat:@"%d", (int)flatPriceSB.value]];

}

-(IBAction)ValueChangeloanRatioTextField:(id)sender{
    loanRatioSB.value= loanRatioTF.text.intValue;
    
    self.loanAmountSB.value = (int) (loanRatioSB.value/100 * flatPriceSB.value);
    [self.loanAmountTF setText:[NSString stringWithFormat:@"%d", (int)loanAmountSB.value]];
    
    [self Calculate:nil];
}

-(IBAction)ValueChangeloanYearTextField:(id)sender{
    loanYearSB.value = loanYearTF.text.intValue;
    
    [self Calculate:nil];
}

-(IBAction)ValueChangeflatPriceTextField:(id)sender{
    flatPriceSB.value = flatPriceTF.text.intValue;
    
    self.loanAmountSB.value = (int) (loanRatioSB.value/100 * flatPriceSB.value);
    [self.loanAmountTF setText:[NSString stringWithFormat:@"%d", (int)loanAmountSB.value]];
    
    [self Calculate:nil];
}

-(IBAction)ValueChangeloanRateTextField:(id)sender{
    loanRateSB.value = loanRateTF.text.doubleValue;
    
    [self Calculate:nil];
}

-(IBAction)ValueChangeloanAmountTextField:(id)sender{
    loanAmountSB.value = loanAmountTF.text.intValue;
    
    self.flatPriceSB.value = (int) (loanAmountSB.value / (loanRatioSB.value/100) );
    [self.flatPriceTF setText:[NSString stringWithFormat:@"%d", (int)flatPriceSB.value]];
    
    [self Calculate:nil];
    
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
