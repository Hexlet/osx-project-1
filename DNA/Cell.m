//
//  Cell.m
//  DNA
//
//  Created by Kirill Morozov on 30.10.12.
//  Copyright (c) 2012 Kirill Morozov. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(id)init {
    self = [super init];
    if (self){
        DNA = [[NSMutableArray alloc] initWithCapacity:DNA_LEN];
        for (int x=0;x<100;x++) {
            [DNA addObject:NUKE_ARR[arc4random() % NUKE_LEN]];
        }
    }
    return self;
}
-(int) hammingDistance: (Cell *)obj {
    int distance = 0;
    for (int i=0;i<DNA_LEN;i++){
        if([[DNA objectAtIndex:i] isEqual: [obj->DNA objectAtIndex:i]])
            distance++;
    }
    return distance;
}
-(NSString *) description {
    return [NSString stringWithFormat:@"DNA: %@", [DNA componentsJoinedByString:@""]];
}
@end
