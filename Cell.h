//
//  Cell.h
//  DNA
//
//  Created by Olexandr Skrypnyk on 03.01.13.
//  Copyright (c) 2013 Olexandr Skrypnyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

{
  NSMutableArray * DNA;
  NSArray * values;
}

- (int) hammingDistance: (Cell *) c;

@end