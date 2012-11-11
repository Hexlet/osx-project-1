//
//  Cell.m
//  Project1_DNA
//
//  Created by Vladimir Koltunov on 04.11.12.
//  Copyright (c) 2012 MacOS 10.7.3. All rights reserved.
//

#import "Cell.h"


@implementation Cell{
  //  NSMutableArray *DNA;
    long rnd;
    int humDist;
}

-(id) init{
    self = [super init];
    template = [NSArray arrayWithObjects:@"A", @"G", @"T", @"C", nil];
    NSLog(@"%@", template);
    if(self){
        DNA = [NSMutableArray arrayWithCapacity:100];
                
        for (int i=0; i<100; i++) {
            
            rnd = arc4random()%4;
            //NSLog(@"%i", rnd);
            [DNA addObject:[template objectAtIndex:rnd]];
        }
        NSLog(@"%lu", [DNA count]);
    }

    return self;
}

-(NSMutableArray *) getDNA{
    return DNA;
}

-(int) hummingDistance:(Cell *) cell{
    humDist = 0;
    for (int i=0; i<100; i++) {
        if ([DNA objectAtIndex:i] != [[cell getDNA] objectAtIndex:i]) {
            humDist++;
            //NSLog(@"current distance = %i", humDist);
        }
    }
    
    return humDist;
}




-(void) printDNA{
   NSLog(@"%@", DNA);
}

@end
