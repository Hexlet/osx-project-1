//
//  Cell.m
//  DNA
//
//  Created by Администратор on 11/2/12.
//  Copyright (c) 2012 Nope. All rights reserved.
//

#import "Cell.h"

#define DNA_SIZE 100

@implementation Cell

-(id) init{
    self = [super init];
    if (self){
        DNA = [NSMutableArray arrayWithCapacity:DNA_SIZE];
        for (int i=0; i<DNA_SIZE; i++){
            switch (arc4random_uniform(4)) {
                case 0:
                    [DNA addObject:@"A"];
                    break;
                case 1:
                    [DNA addObject:@"T"];
                    break;
                case 2:
                    [DNA addObject:@"G"];
                    break;
                default:
                    [DNA addObject:@"C"];
                    break;
            }
        }
    }
    return self;
}

-(NSString*) nucleotideAtIndex: (int) Index{
    return [DNA objectAtIndex:Index];
}

-(void) show{
    NSLog(@"%@", [DNA componentsJoinedByString:@"|"]);
    NSLog(@"DNA size is %li.",DNA.count);
}


-(int) hammingDistance:(Cell*) enemyDNA{
    int hammingDistance = 0;
    for (int i=0; i<DNA.count; i++){
        if (([DNA objectAtIndex:i]!=[enemyDNA nucleotideAtIndex:i])){
            hammingDistance++;
        }
    }
    return hammingDistance;
}

@end
