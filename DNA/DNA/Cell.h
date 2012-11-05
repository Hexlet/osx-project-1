//
//  Cell.h
//  DNA
//
//  Created by Cyxx on 03.11.12.
//  Copyright (c) 2012 Cyxx. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_COUNT   100

@interface Cell : NSObject {
    NSMutableArray *dna;
}

+(NSArray*)nucleotides;
-(void)print;
-(int)hammingDistance: (Cell*)c;

@end
