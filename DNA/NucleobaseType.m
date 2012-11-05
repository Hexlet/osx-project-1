#import "NucleobaseType.h"
#import <stdlib.h>

static NSArray* nucleobaseTypes = nil;

@implementation NucleobaseType

+(NSString*) random {
    return [[self types] objectAtIndex: arc4random_uniform([self typesCount])];
}

+(NSString*) randomExcluding:(NSString *)type {
    NSArray* availableTypes = [[self types] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != %@", type]];
    return [availableTypes objectAtIndex: arc4random_uniform((int)[availableTypes count])];
}

+(NSArray*) types {
    if (!nucleobaseTypes) {
        nucleobaseTypes = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
    }
    return nucleobaseTypes;
}

+(int) typesCount {
    return (int)[[self types] count];
}

@end
