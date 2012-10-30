//
//  Cell.h
//  DNK
//
//  Created by Rybalko Dmitriy on 30.10.12.
//  Copyright (c) 2012 Rybalko Dmitriy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
    NSArray *elements;
}

@property NSMutableArray *DNA;
@property (readonly) NSArray *elements;

- (int)hammingDistance:(Cell *)dna;

@end
