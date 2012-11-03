//
//  Cell.h
//  lab1
//
//  Created by diana shumskaya on 11/3/12.
//  Copyright (c) 2012 diana shumskaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (strong, nonatomic) NSMutableArray *dnaItems;
@property (strong, nonatomic) NSSet *dnaSymbols;

- (int) hammingDistance: (Cell *) cell;

@end
