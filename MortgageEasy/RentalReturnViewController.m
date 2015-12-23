//
//  RentalReturnViewController.m
//  MortgageEasy
//
//  Created by Alex Lee on 20/12/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import "RentalReturnViewController.h"

@interface RentalReturnViewController ()

@end

@implementation RentalReturnViewController

@synthesize flatPriceTF, rentalTF, mgmtFeeTF, otherFeeTF, mortgageRepaymentTF, investmentTF,
            bookReturnLabel, bookReturnAfterTaxLabel, realReturnLabel, realReturnAfterTaxLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.taxRate = 0.15;
    self.taxablePercent = 0.8;
    
    [self calRentalReturn:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)calRentalReturn:(id)sender{
    double flatPrice, rental, mgmtFee, otherFee, mortgageRepayment, investment, bookReturn, bookReturnAfterTax, realReturn, realReturnAfterTax;
    
    NSLog(@"Value of flatPriceTF is %@", flatPriceTF.text);
    NSLog(@"Value of rentalTF is %@", rentalTF.text);
    NSLog(@"Value of mgmtFeeTF is %@", mgmtFeeTF.text);
    NSLog(@"Value of otherFeeTF is %@", otherFeeTF.text);
    NSLog(@"Value of mortgageRepaymentTF is %@", mortgageRepaymentTF.text);
    NSLog(@"Value of investmentTF is %@", investmentTF.text);
    
    flatPrice = flatPriceTF.text.doubleValue;
    rental = rentalTF.text.doubleValue;
    mgmtFee = mgmtFeeTF.text.doubleValue;
    otherFee = otherFeeTF.text.doubleValue;
    mortgageRepayment = mortgageRepaymentTF.text.doubleValue;
    investment = investmentTF.text.doubleValue;
    
    
    bookReturn = (rental - mgmtFee - otherFee)*12/flatPrice;
    bookReturnAfterTax = ((rental - mgmtFee - otherFee)*12 -
                          rental * 12 * self.taxablePercent * self.taxRate)/flatPrice;
    
    realReturn = (rental - mgmtFee - otherFee - mortgageRepayment)*12/investment;
    realReturnAfterTax = ((rental - mgmtFee - otherFee - mortgageRepayment)*12 -
                            rental * 12 *self.taxablePercent * self.taxRate)/investment;
    
    [bookReturnLabel setText:[NSString stringWithFormat:@"%0.2f ", bookReturn*100]];
    [bookReturnAfterTaxLabel setText:[NSString stringWithFormat:@"%0.2f ", bookReturnAfterTax*100]];
    [realReturnLabel setText:[NSString stringWithFormat:@"%0.2f ", realReturn*100]];
    [realReturnAfterTaxLabel setText:[NSString stringWithFormat:@"%0.2f ", realReturnAfterTax*100]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
