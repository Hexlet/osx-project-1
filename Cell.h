//
//  Cell.h
//  HexletDNA
//
//  Created by 4pcbr on 11/1/12.
//  Copyright (c) 2012 4pcbr. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define CELL_ARRAY_CAPACITY 100

// хотелось сделать через enum, но при включенном ARC
// запрещается использовать тип enum в NSMutableArray
//typedef enum {
//    A, T, G, C
//} CellSymbol;

@interface Cell : NSObject {
    NSArray *symbols;
}

@property NSMutableArray *dna;

-(void) initDna;
-(int) hammingDistance:(Cell*) c;
-(NSString*) getRandomSymbol;

@end
