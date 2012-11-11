//
//  Cell.h
//  ProjectDNK
//
//  Created by Сергей Сергеевич on 11.11.12.
//  Copyright (c) 2012 Сергей Сергеевич. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (nonatomic, readonly) NSMutableArray* DNA;

-(int) hammingDistance:(Cell*) cell;
-(NSString*) getRandomGen;
@end
