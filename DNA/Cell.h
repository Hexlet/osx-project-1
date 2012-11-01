//
//  Cell.h
//  DNA
//
//  Created by Aliaksandr Minets on 10/31/12.
//  Copyright (c) 2012 minchik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSMutableArray *dna;
    
}


- (NSMutableArray *) getDna;
- (int) hammingDistance: (Cell *) f;

@end
