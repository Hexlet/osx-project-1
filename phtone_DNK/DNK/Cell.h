//
//  Cell.h
//  DNK
//
//  Created by p.naumov on 01.11.12.
//  Copyright (c) 2012 p.naumov. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_LENGHT 100

@interface Cell : NSObject {
    
    NSMutableArray *DNA;
    NSArray *genes;
}

@property (nonatomic, readonly) NSMutableArray* DNA;

- (int) hammingDistance: (Cell *)cell;
 
+ (NSString*) randomElement;

@end
