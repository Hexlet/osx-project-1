//
//  Cell.h
//  DNA
//
//  Created by Andrey Misura on 03.11.12.
//  Copyright (c) 2012 Andrey Misura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSArray *DNAItems;
}

@property (nonatomic, strong) NSMutableArray *DNA;
//@property (nonatomic, strong) NSArray *DNAItems;

- (NSArray *) DNAItems;
- (int) hammingDistance:(Cell *)cell;

@end
