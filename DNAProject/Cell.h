//
//  Cell.h
//  DNAProject
//
//  Created by Denys Volokh on 1/11/12.
//  Copyright (c) 2012 Denys Volokh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray *DNA;
}

@property (nonatomic, strong) NSMutableArray *DNA;

-(int) hammingDistance: (Cell *) cell;

-(NSString *) generateCharWithExclusion: (NSString *)exclude;
-(NSString *)toString;

@end
