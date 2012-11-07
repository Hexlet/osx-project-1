//
//  Cell.h
//  HexletDNA
//
//  Created by Aleksandr Shepeliev on 04.11.12.
//  Copyright (c) 2012 Aleksandr Shepeliev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
    int length;
}

- (int) hammingDistance:(Cell*) cell;

@end
