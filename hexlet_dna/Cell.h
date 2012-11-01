//
//  Cell.h
//  hexlet_dna
//
//  Created by Misha Shchetinin on 31.10.12.
//  Copyright (c) 2012 Misha Shchetinin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property id dnaArray;

-(void) print;
-(void) populateArray;
-(NSString *) randomNucleotid;
-(NSString *) replaceCurrentNucleotid: (NSString *) c_n;
-(void) hammingDistance: (Cell *) cell; 

@end
