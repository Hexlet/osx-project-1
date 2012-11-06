//
//  Cell.h
//  ProjectDNA
//
//  Created by Alexander Kipman on 04.11.12.
//  Copyright (c) 2012 Alexander Kipman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSMutableArray *DNA;
}

- (id)init;
- (NSMutableArray *)getDNA;
- (NSString *)getRandomChar;
- (int)hammingDistance: (NSMutableArray*)DNA1;

@end
