//
//  MortgagePayment.h
//  MortgageEasy
//
//  Created by Alex Lee on 24/12/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MortgagePayment : NSObject

@property (nonatomic) int tenor;
@property (nonatomic) double total, principle, interest, repayment;

-(void)clear;

@end
