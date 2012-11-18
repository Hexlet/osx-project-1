//
//  Cell.h
//  hexlet-osx-project-1
//
//  Created by Admin on 9/11/12.
//  Copyright (c) 2012 litvak.su. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;


// prints contents of DNA
-(void) print;
// calculates hamming distance between specified cell
-(int) hammingDistance: (Cell *) aCell;
/* 
 static method used to produce random DNA letter
 returns "A", "G", "C", or "T" string
 
 excludingLetter parameter defines which letter must be excluded from generation, if null - no letter is excluded
 */
+(NSString *) getRandomDNALetter: (NSString*) excludingLetter;

@end
