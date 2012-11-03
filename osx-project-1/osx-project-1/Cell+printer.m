//
//  Cell+printer.m
//  osx-project-1
//
//  Created by Pavel Popchikovsky on 11/4/12.
//  Copyright (c) 2012 Pavel Popchikovsky. All rights reserved.
//

#import "Cell+printer.h"
#import "Gene.h"

@implementation Cell (printer)

-(void) print
{
    NSMutableString* DNAString = [NSMutableString string];
    for(Gene* gene in DNA)
        [DNAString appendString:[gene toString]];
    NSLog(@"%@", DNAString);
}

@end
