//
//  Cell.h
//  Project_one_DNA
//
//  Created by КYННЭЙ on 11.11.12.
//  Copyright (c) 2012 i.burnashev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
- (void) print;
- (int) hammingDistance : (Cell *) withCell;
@end