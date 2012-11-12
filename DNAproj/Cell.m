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
 
    self = [super init];
    
    if(self){
        _dnaElements = [NSMutableArray arrayWithObjects: @"A",@"T",@"G",@"C", nil];
        _dna = [NSMutableArray arrayWithCapacity:100];
        _dnaInsertMask = [NSMutableArray arrayWithCapacity:100];
        for (int i=0; i<100; i++)
                [_dna addObject: [_dnaElements objectAtIndex: arc4random() % 4]];

        

    }
    return self;
}

-(void)printDna{
    
    NSLog(@"%@", [self.dna componentsJoinedByString:@""]);
}

-(int)hammingDistance:(Cell *)c{
    
    int k=0;
    
    for (int i = 0; i<100; i++) {
        
        if (![[_dna objectAtIndex:i] isEqual:[c.dna objectAtIndex:i]])
            k++;
            
        
    }
    return k;
}


@end
