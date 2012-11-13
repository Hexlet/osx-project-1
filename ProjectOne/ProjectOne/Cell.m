//
//  Cell.m
//  ProjectOne
//
//  Created by Pavel Gerashchenko on 09.11.12.
//  Copyright (c) 2012 Pavel Gerashchenko. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize DNA;

- (id)init
{
    if (self = [super init]) {
    chars = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil ];
    DNA = [[NSMutableArray alloc] initWithCapacity:100];
    srandom((unsigned) time(NULL));
    for (i=0; i<=100; i++) {
        r = arc4random_uniform(4);
        [DNA insertObject:chars[r] atIndex:i];
    }
    }
    return self;
}
-(int)hammingDistance:(Cell *)cell
{
    int m = 0;
    for (i=0; i<=100; i++)
        if (DNA[i] == cell.DNA[i] ) {
                     m++;
        
              }
    return m;
}



@end
