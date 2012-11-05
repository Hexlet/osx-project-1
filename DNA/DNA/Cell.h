//
//  Cell.h
//  DNA
//
//  Created by Mac on 01.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    int SIZE;
    NSMutableArray *dna;
}

//@property (assign, readwrite) NSMutableArray *dna;

-(void) print; 
-(void) setDna: (int)index withValue: (id)value;
-(id) getDna:(int) index;
-(int)  hammingDistance:(Cell*) mCell; 

@end
