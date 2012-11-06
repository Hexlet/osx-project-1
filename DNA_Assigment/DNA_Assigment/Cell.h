//
//  Cell.h
//  DNA_Assigment
//
//  Created by INOKENTII GOLOVIN on 02.11.12.
//  Copyright (c) 2012 INOKENTII GOLOVIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    int DNALength;
    NSArray *geneValues;
}


@property  NSMutableArray *DNA;

-(NSMutableArray *) createDNA:(int) capacity;
-(NSString *) getRandomGene;
-(int) hammingDistance: (Cell *) cellObj;

@end
