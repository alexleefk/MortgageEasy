//
//  MortgagePayment.m
//  MortgageEasy
//
//  Created by Alex Lee on 24/12/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import "MortgagePayment.h"

@implementation MortgagePayment

- (void)clear{
    self.tenor = 0;
    self.total = 0;
    self.interest = 0;
    self.principle = 0;
    self.repayment = 0;
    
    
}

@end
