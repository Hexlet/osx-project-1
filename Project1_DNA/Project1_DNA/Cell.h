//
//  Cell.h
//  Project1_DNA
//
//  Created by Vladimir Koltunov on 04.11.12.
//  Copyright (c) 2012 MacOS 10.7.3. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSMutableArray *DNA;
    NSArray *template;
}

-(void) printDNA;
-(int) hummingDistance:(Cell *) cell;

@end
