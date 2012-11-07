//
//  Cell.h
//  Learn-osx-project-1
//
//  Created by Mikhail Dudek on 07.11.12.
//  Copyright (c) 2012 Mikhail Dudek. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kLengthOfDNA 100
#define kLetters [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil]
#define kLettersCount 4

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(int)hammingDistance:(Cell*)aCell;

@end
