//
//  Nucleotide.m
//  osx-project-1
//
//  Created by Yuriy Zarovnuy on 07.11.12.
//  Copyright (c) 2012 Yuriy Zarovnuy. All rights reserved.
//

#import "Nucleotide.h"

@implementation Nucleotide

-(id) init {
    self = [super init];
    int randomInt = arc4random() % countNucleotideType;
    [self setType: randomInt];
    return self;
}

-(NSString*) typeToString {
    NSString *result = nil;
    
    switch(_type) {
        case A:
            result = @"A";
            break;
        case T:
            result = @"T";
            break;
        case G:
            result = @"G";
            break;
        case C:
            result = @"C";
            break;
        default:
            [NSException raise: NSGenericException format: @"Unknown NucleotideType."];
    }
    
    return result;
}

-(BOOL) isEqual: (id) other {
    return other
           && [other isKindOfClass: [self class]]
           && _type == ((Nucleotide*)other).type;
}

@end
