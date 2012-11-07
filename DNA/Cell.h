//
//  Cell.h
//  DNA
//
//  Created by user on 30.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Cell : NSObject 
{
    NSArray* symbols;		// array of nucleotides
    NSMutableArray* dnaArray;	// formed DNA
}
//@property (nonatomic, retain) NSMutableArray* dnaArray; 

-(NSMutableArray*) dnaArray;	// getter for #dnaArray
-(int) hammingDistance:(Cell*) aDna;

@end