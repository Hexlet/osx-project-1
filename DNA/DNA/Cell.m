//
//  Cell.m
//  DNA
//
//  Created by sx on 11.11.12.
//  Copyright (c) 2012 sx. All rights reserved.
//

#import "Cell.h"

@implementation Cell{

}

-(id) init {
    self = [super init];
    if (nil != self) { [self initHook]; }
    return self;
}

-(void) initHook
{
    [self setDNA: [[NSMutableArray alloc]initWithCapacity:100]];
    
    for(int i=0; i<DNA_SIZE; ++i){
        [[self DNA] insertObject:[self getRandomChar] atIndex:i];
    }
}

-(NSString*) getRandomChar
{
    int r = [self getRandomNumber:0 to:CHARS_SIZE-1];
    return [NSString stringWithFormat:@"%c", DNA_CHARS[r]];
}

-(int)getRandomNumber:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}

-(int) hammingDistance:(Cell *)target
{
    int diff = 0;
    NSString *val1, *val2;
    
    for(int i=0; i<DNA_SIZE; ++i){
        val1 = [[self DNA] objectAtIndex:i];
        val2 = [[target DNA] objectAtIndex:i];
        if([val1 isNotEqualTo:val2]){ diff++; }
        //NSLog(@"%@ %@ %i", val1, val2, [val1 isNotEqualTo:val2]);
    }
    return diff;
}

-(NSString*) description {
    return [[self DNA] componentsJoinedByString:@""];
}

- (NSMutableArray *)DNA {
    return DNA;
}

- (void)setDNA:(NSMutableArray *)newValue {
    DNA = newValue;
}

@end
