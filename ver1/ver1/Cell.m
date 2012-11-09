//
//  Cell.m
//  ver1
//
//  Created by Denis Sazonov on 11/8/12.
//  Copyright (c) 2012 Denis Sazonov. All rights reserved.
//

#import "Cell.h"
#import "Constants.h"

@implementation Cell

-(NSString *)description {
    NSMutableString * result = [[NSMutableString alloc] init];
    for (NSObject * obj in _dna)  {
        [result appendString:[obj description]];
    }
    return result;
}

-(id)init {
    self = [super init];
    
    if (!self) return nil;

    //initialize chain
    _dna = [[NSMutableArray alloc]init];



    int i=0;
    
        
    
    for (i=0;i<100;i++){

        unichar ch =  [DNA_CHAIN characterAtIndex:arc4random()%4];

        [_dna addObject:[NSString stringWithFormat:@"%C", ch]];
    }
    
    
    return self;
}


-(int) hammingDistance:(Cell *)cell{
    int result=0;
    
    int i=0;
    for (i=0;i<100;i++){
        if ([[cell.dna objectAtIndex:i] isEqual: [_dna objectAtIndex:i]]) result++;
    }
    
    
    
    
    return result;
}

@end
