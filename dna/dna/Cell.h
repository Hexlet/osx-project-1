//
//  Cell.h
//  dna
//
//  Created by Yuriy Ostapyuk on 11/4/12.
//  Copyright (c) 2012 Yuriy Ostapyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dna;

- (int) hammingDistance: Cell;

+ (NSString*) getNucliotideFromArray;

@end
