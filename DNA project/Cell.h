//
//  Cell.h
//  DNA project
//
//  Created by Sergey Starukhin on 01.11.12.
//  Copyright (c) 2012 Sergey Starukhin. All rights reserved.
//

#define kLengthOfDNA 100 // длина ДНК

#import <Foundation/Foundation.h>

@interface Cell : NSObject

- (int)hammingDistance:(Cell *)anotherCell;

@end
