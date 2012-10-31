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
	NSArray* symbols;
    NSMutableArray* dnaArray;
}
//@property (nonatomic, retain) NSMutableArray* dnaArray; 

-(NSMutableArray*) dnaArray;
-(int) hammingDistance:(Cell*) aDna;

@end