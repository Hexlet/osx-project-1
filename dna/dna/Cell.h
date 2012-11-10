//
//  Cell.h
//  dna
//
//  Created by Yuri Kirghisov on 07.11.12.
//  Copyright (c) 2012 Yuri Kirghisov. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_LENGTH 100

@interface Cell : NSObject {
    NSString *dnaLetters[4];
}

@property (retain) NSMutableArray *DNA;

- (int)hammingDistance:(Cell *)aCell;

@end
