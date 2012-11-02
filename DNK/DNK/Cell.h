//
//  Cell.h
//  DNK
//
//  Created by Администратор on 10/25/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property (strong, nonatomic) NSMutableArray* DNA;
@property (strong, nonatomic) NSMutableArray* arnd;
@property (strong, nonatomic) NSArray *nucleotides;
- (int) hammingDistance:(Cell*)otherCell;

@end
