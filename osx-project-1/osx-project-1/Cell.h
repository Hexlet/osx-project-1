//
//  Cell.h
//  osx-project-1
//
//  Created by Антон on 11.11.12.
//  Copyright (c) 2012 FerumFlex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray* DNA;
}

-(int) hammingDistance:(Cell*) cell;
-(NSString*) getRandomGen;
@end
