//
//  Cell.m
//  DNA
//
//  Created by Kirill Beletskiy on 11/2/12.
//  Copyright (c) 2012 Kirill Beletskiy. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init{
    if (self=[super init]) {
        NSArray *randomArray =[[NSArray alloc] initWithObjects:@"A", @"T", @"C", @"G", nil];
        
        _DNA=[NSMutableArray arrayWithCapacity:100];
        
        for (int i=0; i<100; i++) {
            int index=random()%4;
            [_DNA addObject:[randomArray objectAtIndex:index]];
            
        }
        NSLog(@"%@",_DNA);
    }
    return self;
    }


-(void)printDNA{
    NSLog(@"%@",_DNA);
}

@end
