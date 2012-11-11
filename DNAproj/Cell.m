//
//  Cell.m
//  DNAproj
//
//  Created by Иван Иванов on 10.11.12.
//  Copyright (c) 2012 Иван Иванов. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init{
    NSString const *x = @"f";
    self = [super init];
    if(self){
        _wElements = [NSMutableArray arrayWithObjects: @"A",@"T",@"G",@"C", nil];
        _DNA = [NSMutableArray arrayWithCapacity:100];
        _wDNA = [NSMutableArray arrayWithCapacity:100];
        for (int i=0; i<100; i++)
                [_DNA addObject: [_wElements objectAtIndex: random() % 4]];
        

    }
    return self;
}

-(void)printDNA{
    NSLog(@"%@", [_DNA componentsJoinedByString:@""]);
}

-(int)hammingDistance:(Cell *)c{
    int k=0;
    for (int i = 0; i<100; i++) {
        NSLog(@"%@   -   %@  -  %@", [_DNA objectAtIndex:i], [c.DNA objectAtIndex:i], [_wDNA objectAtIndex:i]);
        if (![[_DNA objectAtIndex:i] isEqual:[c.DNA objectAtIndex:i]])
            k++;
            
        
    }
    return k;
}


@end
