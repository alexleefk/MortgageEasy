//
//  PurchasingPowerCal.m
//  MortgageEasy
//
//  Created by Alex Lee on 19/11/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import "PurchasingPowerCal.h"

@interface PurchasingPowerCal ()

@end

@implementation PurchasingPowerCal

@synthesize salaryTF, repaymentTF, mortgageTF, rateTF, yearTF, firstPropSwitch, maxLoanLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.maxLoanLabel.numberOfLines = 0;
    //[self.maxLoanLabel sizeToFit];
    
    //self.firstPropSwitch.state = 1;
    
    [self calMaxLoanAmount:nil ];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(double) calLoanAmount:(double) monthlyRepayment
                        rates:(double) r
                        tenor:(int) t
{
    
    r=r/12/100;
    t=t*12;
    
    NSLog(@"monthlyRepayment = %0.2f", monthlyRepayment);
    NSLog(@"rate = %0.8f", r);
    
    if (monthlyRepayment <=0) {
        return 0;
    }else{
    
        return (monthlyRepayment * (pow((1+r),t)-1))/ (r*pow((1+r),t));
    }
}

-(IBAction)calMaxLoanAmount:(id)sender{
    int salary, monthlyRepayment, otherMortgage, year;
    double rate, r2iRatioN, r2iRatioP, maxLoanN, maxLoanP;
    BOOL firstProp;
    
    salary = salaryTF.text.intValue;
    monthlyRepayment = repaymentTF.text.intValue;
    otherMortgage = mortgageTF.text.intValue;
    year = yearTF.text.intValue;
    rate = rateTF.text.doubleValue;
    
    firstProp = firstPropSwitch.on;
    
    if (firstProp){
        r2iRatioN = 0.5;
        r2iRatioP = 0.6;
        
    }else{
        r2iRatioN = 0.4;
        r2iRatioP = 0.5;
    }
    
    maxLoanN = [self calLoanAmount:(salary-monthlyRepayment-otherMortgage)*r2iRatioN rates:rate tenor:year];
    maxLoanP = [self calLoanAmount:(salary-monthlyRepayment-otherMortgage)*r2iRatioP rates:rate+3 tenor:year];
    
    NSLog(@"maxLoanN = %0.2f", maxLoanN);
    NSLog(@"maxLoanP = %0.2f", maxLoanP);
    
    [maxLoanLabel setText:[NSString stringWithFormat:@"%0.2f", MIN(maxLoanN, maxLoanP)]];
    
    
}

@end
