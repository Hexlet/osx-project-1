//
//  Cell.h
//  Project1-DNA
//
//  Created by Bogdan Pankiv on 11/3/12.
//  Copyright (c) 2012 Bogdan Pankiv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *dna;
}

-(id) init;
-(id) initWithCell: (Cell*)cell;
-(int) hammingDistance: (Cell*)cell;
-(NSNumber *) getDnaAtPosition: (int)pos;
-(void) print;

@end
