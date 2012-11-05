//
//  MyChar.m
//  osx-project-1
//
//  Created by Mikhail on 05.11.12.
//  Copyright (c) 2012 Mikhail. All rights reserved.
//

#import "MyChar.h"

@implementation MyChar

@synthesize value;


+(MyChar*) CharWithValue:(char) v
{
    MyChar * res = [[MyChar alloc] init];
    [res setValue: v];
    return res;
}

@end
