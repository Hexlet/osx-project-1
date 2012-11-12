//
//  Cell.m
//  DNK
//
//  Created by Станислава Алиуллова on 06.11.12.
//  Copyright (c) 2012 self. All rights reserved.
//

#import "Cell.h"
#import <stdio.h>

@implementation Cell{
    NSMutableArray *DNA;
    int len;
    
}

+(id) getRandomNucl{
    int n = arc4random_uniform(4);
    
    switch (n) {
        case 0: return @"A";
            break;
        case 1: return @"G";
            break;
        case 2: return @"T";
            break;
        case 3: return @"C";
            break;
        default: return @"M"; //imposible
            break;
    }
    
}

-(id)init {
    self = [super init];
    len = 100;
    DNA = [NSMutableArray arrayWithCapacity:len];
    for(NSInteger i=0;i< len;i++){
        [DNA insertObject:[Cell getRandomNucl] atIndex:i];
    }
    return self;
}

-(id) getDNA{
    return DNA;
};

-(void)print {
    for(NSInteger i=0;i< len;i++){
        printf("%s",[DNA[i] cStringUsingEncoding:NSASCIIStringEncoding]);
      
    }
    printf("\n");
}

-(int) hammingDistance:(Cell*) cell{
    int cntr = 0;
    
    for(NSInteger i=0;i< len;i++){
        if (![DNA[i] isEqualToString: cell.getDNA[i]]) {
           
            ++cntr;
        };
    }
    
    return cntr;
    
}


@end
