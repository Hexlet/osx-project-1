//
//  Cell.h
//  DNA
//
//  Created by Екатерина Полищук on 06.11.12.
//
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) int nucleotidesCount;
@property (readonly) int maxSetSymbols;
@property NSMutableArray* DNA;
@property NSArray* nucleotides;

-(int) hammingDistance: (Cell*) theCell;

@end
