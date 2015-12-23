//
//  PaymentDetailCell.h
//  MortgageEasy
//
//  Created by Alex Lee on 22/12/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *tenorLabel, *principleLabel, *interestLabel,
*totalLabel, *remainingLabel;

@end
