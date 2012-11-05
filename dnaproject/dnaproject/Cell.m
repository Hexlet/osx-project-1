//
//  Cell.m
//  dnaproject
//
//  Created by Grisha Silver on 05.11.12.
//  Copyright (c) 2012 Grisha Silver. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init{
    self = [super init];
    if (self) {
        DNA = [[NSMutableArray alloc] init];
        for (int i = 0 ; i < 100; i++) {
            r = arc4random() % 4 + 1;
            if(r==1){
                v=@"A";
            }
            else if(r==2){
                v=@"T";
            }
            else if (r==3){
                v=@"G";
            }
            else  v=@"C";
            [DNA addObject:[NSString stringWithFormat:@"%@", v]];

        }
        return self;
    }
}

-(int)hammingDistance:(Cell *)cell
{
    int hd = 0;
    for(int i =0; i < 100; i++){
      
        if ([cell DNA][i] != DNA[i]){
            hd++;
        }
    }
    return hd;
}

-(NSMutableArray*)DNA
{
    return DNA;
}


@end
