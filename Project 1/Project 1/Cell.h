//
//  Cell.h
//  Project 1
//
//  Created by Администратор on 11/5/12.
//  Copyright (c) 2012 hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DNAArrayLength 100

@interface Cell : NSObject
{
    NSMutableArray *DNA;
    NSArray *DNACharArray;
}

-(int) hammingDistance:(Cell*) cell;
-(NSString*) getDNKLetter:(int) position;
@end
