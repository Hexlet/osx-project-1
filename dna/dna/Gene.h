//
//  Gene.h
//  dna
//
//  Created by Evgeny Trefilov on 11/4/12.
//  Copyright (c) 2012 Evgeny Trefilov. All rights reserved.
//
// should be nucleotid (not gene) indeed, but it's a bit late to rename 

#import <Foundation/Foundation.h>

@interface Gene : NSObject

@property (strong) NSString* value;

-(void)mutate;

@end
