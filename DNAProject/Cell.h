//
//  Cell.h
//  DNAProject
//
//  Created by Olga Andreyeva on 11/4/12.
//  Copyright (c) 2012 Olga Andreyeva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
}

@property (readonly) NSMutableArray *DNA;
@property (readonly) NSArray *symbols;
@property (readonly) int DNALength;
- (int) hammingDistance: (Cell*)c;

@end
