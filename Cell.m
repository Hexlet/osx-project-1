//
//  Cell.m
//  DNK
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 witem.artem@gmail.com. All rights reserved.
//

#import "Cell.h"

@implementation Cell 
-(id) init {
    size=100;
    DNA=[NSMutableArray arrayWithCapacity:size];
    self = [super init];
    if (self) {
        for (count=0; count<size; count++) {
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
                case 3:
                    [DNA addObject:@"C"];
                    break;
            }            
        }
    }
    return self;
}

-(int) hammingDistance: (Cell *) newDNA {
    int a = 0;
    for (count=0; count<size; count++) {
        if ([DNA objectAtIndex:count]!=[newDNA->DNA objectAtIndex:count]) {
            a++;
        }
    }
    return a;
}

/*-(void) print  {
    NSLog(@"%@", DNA);
}*/
	
@end
