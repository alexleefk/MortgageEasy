//
//  PaymentDetailCell.m
//  MortgageEasy
//
//  Created by Alex Lee on 22/12/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import "PaymentDetailCell.h"

@implementation PaymentDetailCell

@synthesize tenorLabel, principleLabel, interestLabel, totalLabel, remainingLabel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
