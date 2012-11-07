//
//  Call.m
//  DNK
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 witem.artem@gmail.com. All rights reserved.
//

#import "Call.h"

@implementation Call 
-(id) init {
    DNA=[NSMutableArray arrayWithCapacity:100];
    self = [super init];
    if (self) {
        for (count=0; count<100; count++) {
            switch (arc4random()%4) {
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
                    
                default:
                    break;
            }            
        }
    }
    return self;
}

-(int) hammingDistance: (Call *) newDNA {
    int a = 0;
    for (count=0; count<100; count++) {
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
