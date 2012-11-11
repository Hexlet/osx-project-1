//
//  Nucleotide.m
//  helloworld
//
//  Created by Volodia on 10.11.12.
//
//

#import "Nucleotide.h"

@implementation Nucleotide

-(id) initWithName: (NSString * ) name {
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

// override
-(BOOL) isEqual:(id)other {
    if (other == self) {
        return YES;
    }
    if (!other || [other isKindOfClass:[self class]]) {
        return NO;
    }
    Nucleotide * otherNucleo = other;
    return [_name isEqualTo:otherNucleo.name];
}

@end
