//
//  Cell.h
//  DNA
//
//  Created by Tolya on 01.11.12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
}

+ (NSString *)randomChar;

- (int)hammingDistance:(Cell *)anotherCell;

@end
