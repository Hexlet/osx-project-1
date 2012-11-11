//
//  Cell.h
//  DNA_syabro
//
//  Created by Max Syabro on 07.11.12.
//  Copyright (c) 2012 Max Syabro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

- (int) hammingDistance: (Cell *) c;
- (void) generateDNA: (int) len;
- (NSString*) getRandomCell;
- (NSString*) getRandomCell: (NSString*) exclude;
- (void) printDNA;
@end
