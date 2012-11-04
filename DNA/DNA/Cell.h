//
//  Cell.h
//  DNA
//
//  Created by Eraser on 11/4/12.
//  Copyright (c) 2012 Eraser. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {A, T, G, C} nucleotides;

@interface Cell : NSObject
{
    NSMutableArray *DNA;
    int DNALenght;
}

@property NSMutableArray *DNA;

-(id) init;
-(int) hammingDistance: (Cell *) c;
-(void) print;

@end


@interface Nucleotid : NSObject
{
    nucleotides nucleo;
}

@property nucleotides nucleo;

+(nucleotides) random;
-(id) init;
-(BOOL) isEqual: (Nucleotid *) n;
-(char) getSymbol;

@end
