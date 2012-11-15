//
//  Cell.h
//  Project1_DNA
//
//  Created by Vladimir Koltunov on 04.11.12.
//  Copyright (c) 2012 XCode 4.2.1. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DNA_CAPACITY 100


@interface Cell : NSObject{
    NSMutableArray *DNA;
}


+(NSArray *) getDNATemplate;

-(void) printDNA;

-(int) hammingDistance:(Cell *) cell;
-(NSMutableArray*) getDNA;

@end
