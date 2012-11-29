//
//  Cell.m
//  DNA
//
//  Created by Сергей Греков on 06.11.12.
//  Copyright (c) 2012 Сергей Греков. All rights reserved.
//

#import "Cell.h"


@implementation Cell


-(id) init{
    self = [super init];
    if (self){
        self.DNA = [ [NSMutableArray alloc] init];
        dict = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
        for(int i = 0; i < DNA_LEN; i++){
            int r = arc4random_uniform([dict count]);
            [self.DNA addObject:[dict objectAtIndex:r]];
        }
    }
    return self;
}

-(int)hammingDistance:(Cell *) foreignCell{
    int distance = 0;
    for(int i = 0; i < [_DNA count]; i++){
        NSString *mElement = [_DNA objectAtIndex:i];
        NSString *foreignElement = [foreignCell.DNA objectAtIndex:i];
        if (![mElement isEqualToString:foreignElement]){
            distance++;
        }
    }
    return distance;
}

-(void)print:(NSArray *) arr{
    NSString *toPrint = @"";
    
    for (int i = 0; i < [arr count]; i++)
    {
        toPrint = [toPrint stringByAppendingString:@","];
        toPrint = [toPrint stringByAppendingString:[self.DNA objectAtIndex:i]];
    }
    NSLog(@"%@",toPrint);
}



@end
