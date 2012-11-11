//
//  Cell.h
//  DNA_HW
//
//  Created by Anatoly Tarnavsky on 11/9/12.
//  Copyright (c) 2012 Anatoly Tarnavsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject


@property NSMutableArray *DNA;

-(int)hammingDistance:(Cell*)cell;


@end
