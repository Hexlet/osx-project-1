//
//  Cell.h
//  DNA
//
//  Created by Eraser on 11/4/12.
//  Copyright (c) 2012 Eraser. All rights reserved.
//

typedef enum {A, T, G, C} nucleotides;

@interface Cell : NSObject
{
    int DNALenght;
}

@property NSMutableArray *DNA;

-(id) init;
-(int) hammingDistance: (Cell *) c;
-(void) print;

@end


@interface Nucleotid : NSObject

@property nucleotides nucleic;

+(nucleotides) random;
-(id) init;
-(BOOL) isNotEqual: (Nucleotid *) n;
-(char) getSymbol;

@end
