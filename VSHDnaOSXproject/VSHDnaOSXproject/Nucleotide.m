//
//  Nucleotide.m
//  VSHDnaOSXproject
//
//  Created by vshcryabets@gmail.com on 11/5/12.
//  Copyright (c) 2012 vshcryabets@gmail.com. All rights reserved.
//

#import "Nucleotide.h"

@implementation Nucleotide
static NSArray* values = nil;

-(Nucleotide*)init {
    self = [super init];
    if ( values == nil ) {
        values = @[@"A", @"T", @"G", @"C"];
    }
    if ( self ) {
        _val = values[arc4random_uniform(values.count)];
    }
    return self;
}

-(NSString*)description {
    return _val;
}
-(void)mutate {
    NSUInteger pos = [values indexOfObject:_val];
    int rnd = arc4random_uniform((uint32_t)values.count-1);
    pos = pos + rnd + 1;
    pos = pos % values.count;
    _val = values[pos];
}
-(BOOL)isEqualTo:(id)object {
    if ( [object isKindOfClass:[Nucleotide class]]) {
        return [_val isEqual:[object val]];
    }
    return NO;
}
@end
