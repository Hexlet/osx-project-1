//
//  Molecule.m
//  osx-project-1
//
//  Created by Ivan Ushakov on 11/5/12.
//  Copyright (c) 2012 Ivan Ushakov. All rights reserved.
//

#import "Molecule.h"

@implementation Molecule

+(Molecule *)getA
{
    static Molecule *m;
    if (m == nil)
    {
        m = [[Molecule alloc] initWithName: @"A"];
    }
    return m;
}


+(Molecule *)getT
{
    static Molecule *m;
    if (m == nil)
    {
        m = [[Molecule alloc] initWithName: @"T"];
    }
    return m;
}


+(Molecule *)getG
{
    static Molecule *m;
    if (m == nil)
    {
        m = [[Molecule alloc] initWithName: @"G"];
    }
    return m;
}


+(Molecule *)getC
{
    static Molecule *m;
    if (m == nil)
    {
        m = [[Molecule alloc] initWithName: @"C"];
    }
    return m;
}

-(Molecule *)initWithName: (NSString *)string
{
    self = [super init];
    if (self) {
        name = string;
    }
    return self;
}

-(NSString *)toString
{
    return name;
}

-(BOOL)equal: (Molecule *)molecule
{
    return [name compare: [molecule toString]] == 0;
}

@end
