//
//  Cell.h
//  homeWorkDNA
//
//  Created by Mac on 04.11.12.
//  Copyright (c) 2012 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdlib.h>

@interface Cell : NSObject

{
    NSMutableArray *dna;
    NSArray *elDna;
}

-(id) init;
-(int) hammingDistance:(Cell *) c;

@end
