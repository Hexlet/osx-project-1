//
//  Molecule.h
//  osx-project-1
//
//  Created by Ivan Ushakov on 11/5/12.
//  Copyright (c) 2012 Ivan Ushakov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Molecule : NSObject
{
    NSString *name;
}

+(Molecule *)getA;
+(Molecule *)getT;
+(Molecule *)getG;
+(Molecule *)getC;

-(Molecule *)initWithName: (NSString *)string;

-(NSString *)toString;

-(BOOL)equal: (Molecule *)molecule;

@end
