//
//  Cell.m
//  osx-project-1
//
//  Created by HexletStudent13 on 10/31/12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init{
    self = [super init];
    if(self){
        _dnaAlphabet = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
        _DNA = [NSMutableArray arrayWithCapacity:DNALENGTH];
        while(_DNA.count < DNALENGTH){
            [_DNA addObject:[self randomDnaChar]];
        }
    }
    return self;
}

- (NSString*) randomDnaChar{
    return [_dnaAlphabet objectAtIndex:(arc4random() % _dnaAlphabet.count)];
}

-(int) hammingDistance:(Cell *)cell{
    uint count = 0;
    for(int i = 0; i<DNALENGTH; i++){
        if(![[_DNA objectAtIndex:i] isEqualToString:[cell.DNA objectAtIndex:i]]){
            count++;
        }
    }
    return count;
}

- (NSString*) description{
    return [_DNA componentsJoinedByString:@""];
}

@end
