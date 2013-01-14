//
//  Cell.h
//  arrayRandoom
//
//  Created by vladimir on 14.01.13.
//  Copyright (c) 2013 Владимир Ковалев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray * DNA;
}

- (int) hammingDistance:(Cell*) obj;
- (NSMutableArray*) returnDNA;

@end
